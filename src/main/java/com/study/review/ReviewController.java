package com.study.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.designer.DesignerDTO;
import com.study.designer.DesignerService;
import com.study.utility.Utility;

@Controller
public class ReviewController { 
  private static final Logger log = LoggerFactory.getLogger(ReviewController.class); // 로그기록
  @Autowired
  @Qualifier("com.study.review.ReviewServiceImpl")
  private ReviewService service;
  @Autowired
  @Qualifier("com.study.designer.DesignerServiceImpl")
  private DesignerService dservice;

  
  @DeleteMapping("/review/{rno}")
  public ResponseEntity<String> delete(@PathVariable("rno") int rno) {
 
    //log.info("remove: " + rno);
 
    return service.delete(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
  
  @PutMapping("/review/")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  public ResponseEntity<String> update( ReviewDTO vo, String oldfile, HttpSession session, MultipartFile addfile) {
 
    //System.out.println("modify: " + vo);
    
    // 파일 업데이트 START
    String basePath = UploadReview.getUploadDir();
    if (oldfile != null) { // 원본파일 삭제
      Utility.deleteFile(basePath, oldfile);
    }

    String upDir = UploadReview.getUploadDir();
   //int size = (int) vo.getAddfile().getSize();
    if (vo.getAddfile() != null) {
      String fname = Utility.saveFileSpring(vo.getAddfile(), upDir);
      vo.setRfilename(fname);
    }
    
    //기존 수정만
    return service.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
  
  @PostMapping("/review/create")
  @ResponseBody
  public ResponseEntity<String> create(ReviewDTO vo) {
    log.info("title: " + vo);
    //System.out.println("create: " + vo);
    
    String upDir = UploadReview.getUploadDir();
    if (vo.getAddfile() !=null) {
      String fname = Utility.saveFileSpring(vo.getAddfile(), upDir);
      vo.setRfilename(fname);
    } 
    
    vo.setRcontent(vo.getRcontent().replaceAll("/n/r", "<br>"));  // 모달등록
 
    int flag = service.create(vo);
 
    //log.info("Review INSERT flag: " + flag);
 
    return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    
  }
  
  
  @GetMapping("/review/list/{rno}")
  public ResponseEntity<ReviewDTO> read (@PathVariable("rno") int rno) {  //조회
 
    //log.info("get: " + rno);
 
    return new ResponseEntity<>(service.read(rno), HttpStatus.OK);
  }
  
  
  @RequestMapping("/review/list")
  private String list (HttpSession session, HttpServletRequest request, Model model) {  //리스트 페이지
    DesignerDTO ddto = dservice.dmypage((String)session.getAttribute("did"));
    model.addAttribute("ddto", ddto);
     //log.info("star: "+ service.starAvg());
    
    // 검색관련------------------------
    String col = Utility.checkNull(request.getParameter("col"));
    String word = Utility.checkNull(request.getParameter("word"));
 
    if (col.equals("total")) {
      word = "";
    }
 
    // 페이지관련-----------------------
    int nowPage = 1;// 현재 보고있는 페이지
    if (request.getParameter("nowPage") != null) {
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
    int recordPerPage = 3;// 한페이지당 보여줄 레코드갯수
 
    // DB에서 가져올 순번-----------------
    int sno = ((nowPage - 1) * recordPerPage) ;
    // int eno = nowPage * recordPerPage;
 
    Map map = new HashMap();
    map.put("col", col);
    map.put("word", word);
    map.put("sno", sno);
    map.put("cnt", recordPerPage);
 
    int total = service.total(map);
 
    List<ReviewDTO> list = service.list(map);
 
    String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
 
    // request에 Model사용 결과 담는다
    request.setAttribute("list", list);
    request.setAttribute("nowPage", nowPage);
    request.setAttribute("col", col);
    request.setAttribute("word", word);
    request.setAttribute("paging", paging);
    request.setAttribute("starAvg", String.format("%.2f",service.starAvg()));  //평균 별점 소수점 2번째자리까지
    
    return "/review/list";
  }
}
  