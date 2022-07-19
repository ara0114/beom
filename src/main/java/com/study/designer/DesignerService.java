package com.study.designer;

import java.util.List;
import java.util.Map;

import com.study.hairmenu.HairmenuDTO;
import com.study.reservation.EnrollDTO;
import com.study.reserve.ReserveDTO;

public interface DesignerService {

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

  List<HairmenuDTO> enroll_list(String did); //예약 등록 리스트(hairmenu가 기준인 쿼리)
  List<EnrollDTO> enrollList(String did); //예약 등록 리스트(enroll이 기준인 쿼리)
  
  List<ReserveDTO> reserve_list(String did);

  int dupdateFile(Map map);

  

}