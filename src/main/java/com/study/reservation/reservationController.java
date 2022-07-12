package com.study.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class reservationController {
  
  @GetMapping("/reservation/designer")
  public String reservation() {
    
    
    return "/reservation/designer";
  }
}
