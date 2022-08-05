package com.study.heart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class HeartController { 
  private static final Logger log = LoggerFactory.getLogger(HeartController.class); // 로그기록
  @Autowired
  @Qualifier("com.study.heart.HeartServiceImpl")
  private HeartService service;
  


}
  