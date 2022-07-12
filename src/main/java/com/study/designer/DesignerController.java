package com.study.designer;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
  public String create(DesignerDTO ddto, LicenseDTO ldto) {
    int flag1 = dservice.dcreate(ddto);
    int flag2 = dservice.lcreate(ldto); // --> 수첩형일 경우랑 상장형일 경우 나눠서 코딩
    
    if(flag1 == 1 && flag2 == 1) {
      return "redirect:/";
    }else {
      return "error";
    }
  }
}
