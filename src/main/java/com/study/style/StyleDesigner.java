package com.study.style;

import java.io.IOException;
import java.util.Base64;
import java.util.Base64.Encoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class StyleDesigner {

  @Autowired
  @Qualifier("com.study.style.StyleServiceImpl")
  private StyleService service;
  
  @GetMapping("/style/designer")
  public String style() {

    return "/style/designer";
  }

  @PostMapping("/style/designer")
 public String file(MultipartFile file, String gender, String did ) throws IOException {
    
    StyleDTO dto = new StyleDTO();
    
    Encoder encoder = Base64.getEncoder();
    
    //String fileName = file.getOriginalFilename();
    String fileType = file.getContentType();
    byte[] fileBytes = file.getBytes();
    String encodeString = encoder.encodeToString(fileBytes);
    
    dto.setDid(did);
    dto.setGender(gender);
    dto.setImagecode(fileBytes);
    dto.setImagetype(fileType);
    
    System.out.println(fileBytes);
    System.out.println((encodeString));
    System.out.println(gender);
    System.out.println(did);
    return "NULL";
  }
  
}


  
  
