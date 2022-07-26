package com.study.enroll;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EnrollController {

  @Autowired
  @Qualifier("com.study.enroll.EnrollServiceImpl")
  private EnrollService service;

  @GetMapping("/enroll/designer")
  public String reservation(Model model, HttpSession session) {
    // 아래 id 는 디자이너페이지에서 받을 디자이너아이디
    String id = (String)session.getAttribute("did");

    List<HairmenuDTO> list = service.list(id);
    model.addAttribute("list", list);
    System.out.println("리스트" + list);

    // 디자이너가 등록한 카테고리 list 갖고오기.
    Set<CategoryDTO> catenameList = service.catenameList(id);
    System.out.println(catenameList);
    model.addAttribute("cateNameList", catenameList);

    // 디자이너가 등록한 (menu , pirce) list 갖고오기

    List<HairmenuDTO> menuPriceList = service.menuPriceList(id);
    model.addAttribute("menuPriceList", menuPriceList);

    return "/enroll/designer";
  }

  @GetMapping("/datareq/{gender}/{category}")
  @ResponseBody
  public List<HairmenuDTO> list(@PathVariable("gender") String gender, @PathVariable("category") String category,
      Model model, HttpSession session) {
    //String did = "designer1";
    String did = (String)session.getAttribute("did");
    Map map = new HashMap();
    map.put("id", did);
    map.put("hgender", gender);
    map.put("catename", category);

    List<HairmenuDTO> list = service.menuInfo(map);
    System.out.println(list);
    return list;
  }

  @DeleteMapping("/enrollList/{enrollno}/{did}")
  @ResponseBody
  public String enrollList(@PathVariable("enrollno") String enrollno, @PathVariable("did") String did, Model model) {
    System.out.println(did);
    int deleteNo = Integer.parseInt(enrollno);
    int cnt = service.enrollDelete(deleteNo);

    return "삭제 성공";
  }

  // 예약 입력 후 sumbit 버튼 클릭시 입력데이터 를 받는컨트롤러
  @PostMapping("/designerMypage")
  public String reservationList(String category, String gender, String menu, String price, String time, String date,
      String did, Model model, HttpSession session) {
    Map map = new HashMap();
    map.put("date", date);
    map.put("time", time);
    map.put("emenu", menu);
    map.put("eprice", price);
    map.put("did", (String)session.getAttribute("did"));

    Map map2 = new HashMap();
    map2.put("menu", menu);
    map2.put("did", did);
    HairmenuDTO dto = service.menunoGet(map2);
    System.out.println("ex 1 : " + dto);
    map.put("menuno", dto.getMenuno());
    // 예약등록
    int cnt = service.enrollInput(map);
    System.out.println("cnt : " + cnt);
    if (cnt == 1) {
      return "redirect:/enrollList";
    } else {
      return "error";
    }

  }

  @GetMapping("/enrollList")
  public String enrollList(HttpSession session, Model model) {
    //디자이너 예약등록 리스트
    model.addAttribute("list", service.enrollList((String) session.getAttribute("did")));
    //고객예약신청리스트
    List<EnrollDTO> infoList = service.infoList((String)session.getAttribute("did"));
    System.out.println(infoList);
    model.addAttribute("infoList", service.infoList((String)session.getAttribute("did")));
    return "/enrollList";
  }

  // 고객 예약신청 페이지
  @GetMapping("/reserve")
  public String reserve(HttpSession session, Model model) {
    // 디자이너 프로필에서 user id 와 designer id 를 넘겨받고 시작한다.
    // 임의로 user id는 하드코딩 하여 테스트 . 나중에 session 으로 넘어올것으로 예상
    //String userId = "user1";
    String userId = (String)session.getAttribute("uid");
    
    // 디자이너 id 를 이용해서 예약 리스트를 불러온다.
    model.addAttribute("uid", userId);
    model.addAttribute("list", service.enrollList((String) session.getAttribute("did")));
    return "/reserve";
  }

  // PostMapping 은 insert 만 담당
  @PostMapping("/reserve")
  public String reserveInsert(HttpSession session,String enrollno, String uid, String message) {
    Map map = new HashMap<>();
    map.put("enrollno", enrollno);
    map.put("uid", uid);
    map.put("message", message);
    //session.setAttribute("uid", uid); //session 으로 유저아이디가 넘어온다면 지금코드는 따로할필요없다
    //  insert 하고
    int cnt = service.userInsert(map);
    if (cnt == 1) {
      System.out.println("reserve insert success");
      // PRG 패턴 사용
      return "redirect:/reserveList";
    }else {
      return "error";
    }
  }
  
  //GetMapping 은 고객의 예약신청내역 리스트를 조회할수있게처리후 고객의 mypage 로 model 로 넘긴다
  @GetMapping("/reserveList")
  public String reserveList(HttpSession session ,Model model) {
    //유저의 마이페이지로 model 을통해서 reserve list 를 보내준다.
    String uid = (String)session.getAttribute("uid");
    List<EnrollDTO> list = service.reserveList(uid);
    List<EnrollDTO> todayList = service.todayList(uid);
    model.addAttribute("uid", uid);
    model.addAttribute("reserveList", list);
    model.addAttribute("todayList", todayList);
    return "/user/mypage";
  }
  //enrollno 가 reserve 에 있는지 없는지 checking
  @PostMapping("/enrollnoCheck/{enrollno}")
  @ResponseBody
  public String enrollnoChecking(@PathVariable("enrollno") String enrollno) {
    System.out.println(enrollno);
    String no = enrollno;
    int flag = service.checking(no);
    if(flag == 1) {
      System.out.println("체크함");
      String text = "예약불가";
      return text;
    }else {
      return "error";
    }
  }

}
