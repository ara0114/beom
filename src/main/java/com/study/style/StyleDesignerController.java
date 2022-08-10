package com.study.style;

import java.io.IOException;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.designer.DesignerDTO;
import com.study.designer.DesignerService;

@Controller
public class StyleDesignerController {

  @Autowired
  @Qualifier("com.study.style.StyleServiceImpl")
  private StyleService service;
  
  @Autowired
  @Qualifier("com.study.designer.DesignerServiceImpl")
  private DesignerService dservice;

  @GetMapping("/style/designer/{did}")
  public String style(Model model, HttpSession session, @PathVariable String did ) {
    String uid = "";
    if(session.getAttribute("uid") != null) {
      uid = (String)session.getAttribute("uid");
    }
    String id = null;
    if(session.getAttribute("did") != null) {
      id = (String)session.getAttribute("did"); 
    }else{
      id = did;
    }
    
    DesignerDTO ddto = dservice.dmypage(id);
    model.addAttribute("ddto", ddto);
    model.addAttribute("uid", uid);
    
    return "/style/designer";
  }

  // 사진업로드 -> DB 에 Insert
  @PostMapping("/style/designer")
  public String file(MultipartFile file, String uploadgender, HttpSession session, Model model) throws IOException {

    StyleDTO dto = new StyleDTO();

    //Encoder encoder = Base64.getEncoder();

    // String fileName = file.getOriginalFilename();
    String fileType = file.getContentType();
    //System.out.println("fileType : " + fileType );
    if(fileType.equals("application/octet-stream")){
      model.addAttribute("msg", "파일이 선택되지 않았습니다.");
      return "/errorMsg";
    }
    
    byte[] fileBytes = file.getBytes();
    // String encodeString = encoder.encodeToString(fileBytes); 서버측에서 encoding 할경우

    dto.setDid((String)session.getAttribute("did"));
    dto.setGender(uploadgender);
    dto.setImagecode(fileBytes);
    dto.setImagetype(fileType);
    

    int cnt = service.create(dto);
    if(cnt == 1) {
      return "redirect:/style/designer/dto.did";
    }else {
      return "error";
    }
  }

  // 사진전체 리스트 or 성별 로 구분해서보여주기
  @GetMapping("/style/list/{gender}")
  @ResponseBody
  public List<StyleDTO> list(@PathVariable("gender") String gender, Model model) {
    System.out.println(gender); //사진 성별 radio value
    List<StyleDTO> list = service.list(gender);
    return list;
  }

  // 사진 삭제
  @GetMapping("/style/delete/{imgno}")
  @ResponseBody
  public String list(@PathVariable("imgno") String imgno) {
    int imageno = Integer.parseInt(imgno);
    System.out.println(imageno); //삭제할 imageno
    int cnt = service.delete(imageno);
    if (cnt == 1) {
      return "삭제하였습니다.";
    } else {
      return "삭제실패";
    }
  }
  
  

}
