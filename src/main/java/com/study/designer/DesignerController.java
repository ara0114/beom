package com.study.designer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DesignerController {
  
  @Autowired
  @Qualifier("com.study.designer.DesignerServiceImpl")
  private DesignerService dservice;
  
  @GetMapping("/dcreate")
  public String create() {
    return "/dcreate";
  }
  
  @PostMapping("/dcreate")
  public String create(DesignerDTO dto) {
    
    
    return "";
  }
}
