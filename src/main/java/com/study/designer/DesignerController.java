package com.study.designer;

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
    int flag2 = 0;
//    System.out.println(ddto.getDid());
    System.out.println(ldto.getUniquecode2());
    if(ldto.getUniquecode2().equals("")) {//수첩형 자격증
      flag2 = dservice.lcreate1(ldto);
    }else {                            //상장형 자격증
      flag2 = dservice.lcreate2(ldto);
    }
    
    if(flag1 == 1 && flag2 == 1) {
      return "redirect:/";
    }else {
      return "error";
    }
  }
  
  @GetMapping(value = "/emailcheck", produces = "application/json;charset=utf-8")
  @ResponseBody
  public Map<String, String> emailcheck(String email) {
    int cnt = dservice.duplicatedEmail(email);

    Map<String, String> map = new HashMap<String, String>();
    if (cnt > 0) {
      map.put("str", email + "는 중복되어서 사용할 수 없습니다.");
    } else {
      map.put("str", email + "는 중복아님, 사용가능합니다.");
    }
    return map;
  }

  @GetMapping(value = "/idcheck", produces = "application/json;charset=utf-8")
  @ResponseBody
  public Map<String, String> idcheck(String id) {
    int cnt = dservice.duplicatedId(id);

    Map<String, String> map = new HashMap<String, String>();
    if (cnt > 0) {
      map.put("str", id + "는 중복되어서 사용할 수 없습니다.");
    } else {
      map.put("str", id + "는 중복아님, 사용가능합니다.");
    }
    return map;
  }
  
  
  
  @GetMapping("/dlogin")
  public String dlogin(HttpServletRequest request) {
//  /*----쿠키설정 내용시작----------------------------*/
//  String c_id = ""; // ID 저장 여부를 저장하는 변수, Y
//  String c_id_val = ""; // ID 값
//
//  Cookie[] cookies = request.getCookies();
//  Cookie cookie = null;
//
//  if (cookies != null) {
//    for (int i = 0; i < cookies.length; i++) {
//      cookie = cookies[i];
//
//      if (cookie.getName().equals("c_id")) {
//        c_id = cookie.getValue(); // Y
//      } else if (cookie.getName().equals("c_id_val")) {
//        c_id_val = cookie.getValue(); // user1...
//      }
//    }
//  }
//  /*----쿠키설정 내용 끝----------------------------*/
//
//  request.setAttribute("c_id", c_id);
//  request.setAttribute("c_id_val", c_id_val);
    
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
    
    return "/dlogin";
  }
  
  @PostMapping("/dlogin")
  public String dlogin(@RequestParam Map map, HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) {
    int flag = dservice.dlogin(map);
    
    if(flag > 0) {
      DesignerDTO ddto = dservice.dread(String.valueOf(map.get("did")));
      session.setAttribute("did", ddto.getDid());
      session.setAttribute("dname", ddto.getDname());
      session.setAttribute("validation", ddto.isValidation());

      model.addAttribute("ddto", ddto);
      
      Cookie cookie = null;
      String chk_id = request.getParameter("chk_id");
      
      if(chk_id != null) {
        
        cookie = new Cookie("chk_id",chk_id);
        cookie.setMaxAge(60*60*24*90);
        response.addCookie(cookie);
        
        cookie = new Cookie("cookie_id_val",(String) map.get("did"));
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
      return "error";
    }
  }
  
 
  
  @GetMapping("/dmypage")
  public String designer_mypage() {
    return "/dmypage";
  }
}
