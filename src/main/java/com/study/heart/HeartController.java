package com.study.heart;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.designer.DesignerDTO;

@Controller
public class HeartController { 
  private static final Logger log = LoggerFactory.getLogger(HeartController.class); // 로그기록
  @Autowired
  @Qualifier("com.study.heart.HeartServiceImpl")
  private HeartService service;
  
  public HeartDTO plusheart(@RequestParam String did, HttpSession session) {
    HeartDTO hdto = new HeartDTO();
    hdto.setDid(did);
    
    DesignerDTO ddto = service.plusheart(did);
    
    return hdto;
  }

}
  