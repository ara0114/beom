package com.study.hairmenu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.designer.DesignerDTO;
import com.study.designer.DesignerService;

@Controller
public class HairmenuController { 
  private static final Logger log = LoggerFactory.getLogger(HairmenuController.class); // 로그기록
  @Autowired
  @Qualifier("com.study.hairmenu.HairmenuServiceImpl")
  private HairmenuService service;
  @Autowired
  @Qualifier("com.study.designer.DesignerServiceImpl")
  private DesignerService dservice;

  
  @GetMapping("/hairmenu")
  public String list(HttpSession session, Model model, HttpServletRequest request) {
    DesignerDTO ddto = dservice.dmypage((String)session.getAttribute("did"));
    model.addAttribute("ddto", ddto);  // 디자이너 정보 가져오기
    
    Map map = new HashMap();
    List<HairmenuDTO> list = service.list(map);
    
    request.setAttribute("list", list);  //담기
    
    return "/hairmenu";
  }
  
  @PostMapping("/hairmenuEnroll")
  public String hairmenuEnroll(HairmenuDTO dto, HttpSession session, Model model) {
//    DesignerDTO ddto = dservice.dmypage((String)session.getAttribute("did"));
//    //HairmenuDTO dto = 
//    model.addAttribute("ddto", ddto);  // 디자이너 정보 가져오기
    dto.setDid((String)session.getAttribute("did"));
    System.out.println(dto);
    //log.info("dto: " + dto);
    
    if(service.hairmenuEnroll(dto) > 0) {  // 성공 시
      return "/hairmenu";
    } else {
      System.out.println("악");
      return "error";
    }
    
  }
  
  @GetMapping("/hairmenuEnroll")
  public String create() {
    
    return "/hairmenuEnroll";
  }
  

}
  