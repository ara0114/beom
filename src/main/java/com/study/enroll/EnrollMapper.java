package com.study.enroll;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface EnrollMapper {
  List<HairmenuDTO> list(String did);

  Set<CategoryDTO> catenameList(String did);

  List<HairmenuDTO> menuPriceList(String did);

  List<HairmenuDTO> menuInfo(Map map);
  
  int enrollInput(Map map);
  
  HairmenuDTO menunoGet(Map map);
  
  Set<EnrollDTO> enrollList(String did);
  
  int enrollDelete(int enrollno);
  
  int userInsert(Map map);
  
  List<EnrollDTO> reserveList(String uid);
  
  List<EnrollDTO> infoList(String did);
  
}
