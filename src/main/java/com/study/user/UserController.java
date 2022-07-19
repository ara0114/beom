package com.study.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:/";
    }
    
    @GetMapping("/user/login")
    public String login(HttpServletRequest request) {
      
      String chk_id = "";
      String cookie_id_val = "";
      
      Cookie[] cookies = request.getCookies();
      Cookie cookie = null;
      
      if(cookies != null) {
        for(int i=0; i<cookies.length; i++) {
          cookie = cookies[i];
          
          if(cookie.getName().equals("chk_id")) {
            chk_id = cookie.getValue();
          }else if(cookie.getName().equals("cookie_id_val")) {
            cookie_id_val = cookie.getValue();
          }
        }
      }
      
      request.setAttribute("chk_id", chk_id);
      request.setAttribute("cookie_id_val", cookie_id_val);
      
      return "/user/login";
    }
    @PostMapping("/user/login")
    public String login(@RequestParam Map<String,String> map, HttpSession session, 
        HttpServletResponse response, HttpServletRequest request, Model model) {
      
      int cnt = service.loginCheck(map);
      if(cnt>0) {//회원일경우
        Map gmap = service.getGrade(map.get("uid"));
        session.setAttribute("uid", map.get("uid"));
        session.setAttribute("uname", gmap.get("uname"));
        session.setAttribute("grade", gmap.get("grade"));//세션저장
        
        Cookie cookie = null;
        String chk_id = request.getParameter("chk_id");
        
        if(chk_id != null) {
          
          cookie = new Cookie("chk_id",chk_id);
          cookie.setMaxAge(60*60*24*90);
          response.addCookie(cookie);
          
          cookie = new Cookie("cookie_id_val",map.get("uid"));
          cookie.setMaxAge(60*60*24*90);
          response.addCookie(cookie);
          
        }else {
          
          cookie = new Cookie("chk_id","");
          cookie.setMaxAge(0);
          response.addCookie(cookie);
          
          cookie = new Cookie("cookie_id_val","");
          cookie.setMaxAge(0);
          response.addCookie(cookie);
          
        }
        
        return "redirect:/";
      
      }else {
        
        model.addAttribute("msg","아이디 또는 비밀번호를 잘못 입력했거나<br>회원이 아닙니다. 회원가입하세요");
        
        return "/errorMsg";   
      }
    }
    
    @GetMapping("/user/findid")
    public String findid() {
      return "/user/findid";
    }

    @GetMapping("/user/findpw")
    public String findpw() {
      return "/user/findpw";
    }

}
