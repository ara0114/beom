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
  public String reservation(String did, Model model) {
    // 아래 id 는 디자이너페이지에서 받을 디자이너아이디
    String id = "designer1";

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
      Model model) {
    String did = "designer1";
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
  @PostMapping("/designerMypage/reservationList")
  public String reservationList(String category, String gender, String menu, String price, String time, String date,
      String did, Model model, HttpSession session) {
    session.setAttribute("did", did);
    Map map = new HashMap();
    map.put("date", date);
    map.put("time", time);
    map.put("emenu", menu);
    map.put("eprice", price);
    map.put("did", did);

    Map map2 = new HashMap();
    map2.put("menu", menu);
    map2.put("did", did);
    HairmenuDTO dto = service.menunoGet(map2);
    map.put("menuno", dto.getMenuno());
    // 예약등록
    int cnt = service.enrollInput(map);
    if (cnt == 1) {
      return "redirect:/enrollList";
    } else {
      return "error";
    }

  }

  @GetMapping("/enrollList")
  public String enrollList(HttpSession session, Model model) {
    model.addAttribute("list", service.enrollList((String) session.getAttribute("did")));
    return "/enrollList";
  }

  // 고객 예약신청 페이지
  @GetMapping("/reserve")
  public String reserve(HttpSession session,Model model) {
    //디자이너 프로필에서 user id 와 designer id 를 넘겨받고 시작한다.
    //임의로 user id는  하드코딩해서 테스트 하겠다. 나중에 session 으로 넘어올것으로 예상
    String userId = "user1"; 
    //디자이너 id 를 이용해서 예약 리스트를 불러온다.
    model.addAttribute("uid", userId);
    model.addAttribute("list", service.enrollList((String) session.getAttribute("did")));
    return "/reserve";
  }
  //고객 예약하기 를누르면 유저의 mypage 로 전송받은데이터를 insert 하고 PRG 패턴으로 이용한다
  @PostMapping("/reserve/userMypage")
  public String reserveInsert(String enrollno, String uid, String message) {
    System.out.println(enrollno);
    System.out.println(uid);
    System.out.println(message);
    //내일 insert 하고
    //PRG 패턴 사용해야한다
    return "/userReserveList";
  }

}
