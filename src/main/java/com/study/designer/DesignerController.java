package com.study.designer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DesignerController {
  
  
  @GetMapping("/create")
  public String create() {
    return "/create";
  }
}
