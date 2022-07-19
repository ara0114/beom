package com.study.reservation;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class reservationController {

  @Autowired
  @Qualifier("com.study.reservation.ReservationServiceImpl")
  private ReservationService service;

  @GetMapping("/enroll/designer")
  public String reservation(String did, Model model) {
    //아래 id 는 디자이너페이지에서 받을 디자이너아이디
    String id = "designer1";

    List<HairmenuDTO> list = service.list(id);
    model.addAttribute("list", list);
    System.out.println("리스트"+list);

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
  public List<HairmenuDTO> list(@PathVariable("gender") String gender, @PathVariable("category") String category, Model model) {
    String did = "designer1";
    Map map = new HashMap();
    map.put("id",did);
    map.put("hgender",gender);
    map.put("catename",category);
    
    List<HairmenuDTO> list = service.menuInfo(map);
    System.out.println(list);
    return list;
  }
  
  @DeleteMapping("/enrollList/{enrollno}/{did}")
  @ResponseBody
  public String enrollList(
      @PathVariable("enrollno") String enrollno,
      @PathVariable("did") String did,
      Model model) {
    System.out.println(did);
    int deleteNo = Integer.parseInt(enrollno);
    int cnt = service.enrollDelete(deleteNo);
    
    return "삭제 성공";
  }
  
  //예약 입력 후 sumbit 버튼 클릭시 입력데이터 를 받는컨트롤러
  @RequestMapping("/designerMypage/reservationList")
  public String reservationList(
    @RequestParam("category") String category,
    @RequestParam("gender") String gender,
    @RequestParam("menu") String menu,
    @RequestParam("price") String price,
    @RequestParam("time") String time,
    @RequestParam("date") String date,
    @RequestParam("did") String did,
    Model model) {
    Map map = new HashMap();
    map.put("date",date);
    map.put("time",time);
    map.put("emenu",menu);
    map.put("eprice",Integer.parseInt(price));
    map.put("did",did);
    
    Map map2 = new HashMap();
    map2.put("menu",menu);
    map2.put("did",did);
    HairmenuDTO dto = service.menunoGet(map2);
    map.put("menuno",dto.getMenuno());
    //예약등록
    int cnt = service.enrollInput(map);
    if(cnt == 1) {
    Set<EnrollDTO> enrollList = service.enrollList(did);
    System.out.println(enrollList);
    model.addAttribute("list", enrollList);
    }
    
    return "/enrollList";
  }
  
  
}
