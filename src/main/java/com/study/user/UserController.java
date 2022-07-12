package com.study.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    @Autowired
    @Qualifier("com.study.user.UserServiceImpl")
    private UserService service;
    
    @GetMapping("/user/agree")
    public String agree() {
      return "/user/agree";
    }
    
    @GetMapping("/user/userchoice")
    public String userchoice() {
      return "/user/userchoice";
    }
    
    @GetMapping("/user/joinForm")
    public String join() {
      return "/user/join";
    }
    @PostMapping("/user/join")
    public String join(UserDTO dto, HttpServletRequest request) {
      if(service.create(dto)>0) {
        return "redirect:/";
      }else {
        return "error";
      }
    }
    
    @GetMapping(value="/user/idcheck", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String,String> idcheck(String uid){
      int cnt = service.duplicatedId(uid);
      Map<String, String> map = new HashMap<String, String>();
      if(cnt > 0) {
        map.put("str", uid + "는 중복된 아이디입니다.");
      }else {
        map.put("str", uid + "는 사용가능한 아이디입니다.");
      }
      return map;
    }
    @GetMapping(value="/user/emailcheck", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String,String> emailcheck(String uemail){
      int cnt = service.duplicatedEmail(uemail);
      Map<String, String> map = new HashMap<String, String>();
      if(cnt > 0) {
        map.put("str", uemail + "는 중복된 이메일입니다.");
      }else {
        map.put("str", uemail + "는 사용가능한 이메일입니다.");
      }
      return map;
    }
    
}
