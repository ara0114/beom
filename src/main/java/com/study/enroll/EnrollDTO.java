package com.study.enroll;

import java.util.List;

import com.study.designer.DesignerDTO;
import com.study.user.UserDTO;

import lombok.Data;
@Data
public class EnrollDTO {
  private int enrollno;
  private String enrolldate;
  private String enrolltime;
  private int menuno;
  private int eprice;
  private String emenu;
  private String did;
  
  private List<HairmenuDTO> hairmenu;
  private List<DesignerDTO> designerInfo;
  private List<UserDTO> userInfo;
  private List<ReserveDTO> reserveInfo;

}
