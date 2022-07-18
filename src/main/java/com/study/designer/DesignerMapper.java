package com.study.designer;

import java.util.List;
import java.util.Map;

import com.study.hairmenu.HairmenuDTO;
import com.study.reservation.EnrollDTO;
import com.study.reserve.ReserveDTO;

public interface DesignerMapper {

  int dcreate(DesignerDTO ddto);

  int lcreate1(LicenseDTO ldto);
  
  int lcreate2(LicenseDTO ldto);

  int duplicatedId(String id);

  int duplicatedEmail(String email);

  int dlogin(Map map);

  DesignerDTO dread(String did);

  DesignerDTO dmypage(String did);

  int intro_update(Map map);

  LicenseDTO license(String did);

  int dupdate(DesignerDTO ddto);

  List<HairmenuDTO> enroll_list(String did);

  List<ReserveDTO> reserve_list(String did);

  List<EnrollDTO> enrollList(String did);

}
