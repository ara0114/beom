package com.study.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {

  @Autowired
  @Qualifier("com.study.notice.NoticeServiceImpl")
  private NoticeService service;
  
  @GetMapping("/notice/list")
  public String list() {
    return "/notice/list";
  }
}
