package com.study.mail;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.user.UserService;

@Controller
public class MailController {
  @Autowired
  @Qualifier("com.study.user.UserServiceImpl")
  private UserService service;
  
  @Autowired
  private JavaMailSender mailSender;
  
  @Value("${spring.mail.username}")
  private String fromMail;
  
  @GetMapping("/findidmail")
  @ResponseBody
  public String sendIdByMail(@RequestParam Map<String,String> map) {
    
    String uid = service.findId(map);
    String uname = map.get("uname");
    String uemail = map.get("uemail");

    if(uid!=null) {
      
      SimpleMailMessage message = new SimpleMailMessage();
      
      message.setTo(uemail);//받는사람 메일주소
      message.setSubject("[Beom] "+uname+"님의 아이디 안내");//메일제목
      message.setText("해당 정보와 일치하는\n회원님의 아이디는 "+uid+"입니다.");//메일내용
      message.setFrom(fromMail);
      mailSender.send(message);
      
      return "입력하신 이메일로 아이디가 전송되었습니다.";
      
    }else {
      
      return "해당 정보로 등록된 아이디는 존재하지 않습니다.";
    
    }

  }

}
