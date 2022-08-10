package com.study.heart;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

import com.study.designer.DesignerDTO;
import com.study.designer.DesignerService;

@Controller
public class HeartController { 
  private static final Logger log = LoggerFactory.getLogger(HeartController.class); // 로그기록
  @Autowired
  @Qualifier("com.study.heart.HeartServiceImpl")
  private HeartService service;
  @Autowired
  @Qualifier("com.study.designer.DesignerServiceImpl")
  private DesignerService dservice;
  
  
//  @PutMapping("/plusHeart/{did}")
//  public ResponseEntity<String> plusHeart(Model model, @PathVariable String did, HttpSession session) {
//    
//    DesignerDTO ddto = dservice.dmypage(did);
//    model.addAttribute("ddto", ddto);
//    
//    Map map = new HashMap();
//    map.put("did", ddto.getDid());
//    map.put("likecnt", ddto.getLikecnt());
//    
//    //log.info("PLUS : " + ddto);
// 
//    // 하트가 가지고 있는 하트 DTO.get heart_chk 변수(check)로 리턴 받기 
//    // if check 가 0 이면 ++ 하고 디자이너에 likecnt
//    // else 취소 아까꺼에 -1 check -- 
//    return dservice.plus(map) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
//        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
// 
//  }
//  
//  @PutMapping("/minusHeart/{did}")
//  public ResponseEntity<String> minusHeart(Model model, @PathVariable String did, HttpSession session) {
//    
//    DesignerDTO ddto = dservice.dmypage(did);
//    model.addAttribute("ddto", ddto);
//    
//    Map map = new HashMap();
//    map.put("did", ddto.getDid());
//    map.put("likecnt", ddto.getLikecnt());
//    
//    //log.info("MINUS : " + ddto);
// 
//    return dservice.minus(map) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
//        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
// 
//  }

}
  