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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
  

  
  @GetMapping("/hairmenu/delete/{menuno}")
  public String delete(@PathVariable("menuno") int menuno, Model model) {
    //System.out.println("번호");
    
      int cnt = 0;
      
      try {
       cnt =  service.delete(menuno);
       return "redirect:/hairmenu";
       
      } catch(Exception e) {
        e.printStackTrace();
        model.addAttribute("msg", "예약이 등록되어 있어 삭제가 불가능합니다.");
        return "/errorMsg";
      }

  }
  
  @GetMapping("/hairmenu/cateno/{cateno}")
  public String itemlist(HttpSession session, Model model, HttpServletRequest request, @PathVariable int cateno) {
    DesignerDTO ddto = dservice.dmypage((String)session.getAttribute("did"));
    model.addAttribute("ddto", ddto);  // 디자이너 정보 가져오기
    
    
    List<HairmenuDTO> list = service.itemlist(cateno);  //카테번호별 리스트 가져오기
    
    request.setAttribute("list", list);  //담기
    
    return "/hairmenu";
  }
  
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
  public String hairmenuEnroll(HttpSession session, Model model, HttpServletRequest request, HairmenuDTO dto) {
    DesignerDTO ddto = dservice.dmypage((String)session.getAttribute("did"));
    model.addAttribute("ddto", ddto);  // 디자이너 정보 가져오기
    
    dto.setDid((String)session.getAttribute("did"));
   // log.info("dto: " + dto);
    
    
    if(service.hairmenuEnroll(dto) == 1) {  // 성공 시
      return "redirect:/hairmenu";
    } else {
      return "error";
    }
    
  }
  
  @GetMapping("/hairmenuEnroll")
  public String create() {
    
    return "/hairmenuEnroll";
  }
  

}
  