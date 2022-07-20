package com.study.hairmenu;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HairMenuController { 
  private static final Logger log = LoggerFactory.getLogger(HairMenuController.class); // 로그기록
  @Autowired
  @Qualifier("com.study.hairmenu.HairMenuServiceImpl")
  private HairMenuService service;

  @RequestMapping("/hairmenu")
  private String hairmenu() {
    
    return "/hairmenu";
  }
  

}
  