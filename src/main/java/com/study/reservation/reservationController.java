package com.study.reservation;

import java.util.List;

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
    return "/reservation/designer";
  }
}
