package com.study.reservation;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class reservationController {
  
  @Autowired
  @Qualifier("com.study.reservation.ReservationServiceImpl")
  private ReservationService service;
  
  @GetMapping("/reservation/designer")
  public String reservation(String did,Model model) {
    String id = "designer1";
    
    List<HairmenuDTO> list = service.list(id); 
    model.addAttribute("list", list);
    System.out.println(list);

    //디자이너가 등록한 카테고리 list 갖고오기.
    Set<CategoryDTO> catenameList = service.catenameList(id);
    System.out.println(catenameList);
    model.addAttribute("cateNameList", catenameList);
    
    //디자이너가 등록한 (menu , pirce) list 갖고오기
    
    List<HairmenuDTO> menuPriceList = service.menuPriceList(id); 
    model.addAttribute("menuPriceList", menuPriceList);
    System.out.println(menuPriceList);
    
    return "/reservation/designer";
  }
}
