package com.study.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.utility.Utility;

@Controller
public class ReviewController { 
  private static final Logger log = LoggerFactory.getLogger(ReviewController.class); // 로그기록
  @Autowired
  @Qualifier("com.study.review.ReviewServiceImpl")
  private ReviewService service;

//  @RequestMapping("/review/reviewForm")
//  private String review() {
//    
//    return "/review/reviewForm";
//  }
  
  @GetMapping("/review/list/{rno}")
  public ResponseEntity<ReviewDTO> get(@PathVariable("rno") int rno) {  //조회
 
    log.info("get: " + rno);
 
    return new ResponseEntity<>(service.read(rno), HttpStatus.OK);
  }
  
  @RequestMapping("/review/list")
  private String list(HttpServletRequest request) { 
    
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
    
    return "/review/list";
  }
}
  
