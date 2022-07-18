package com.study.reservation;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface ReservationMapper {
  List<HairmenuDTO> list(String did);

  Set<CategoryDTO> catenameList(String did);

  List<HairmenuDTO> menuPriceList(String did);

  List<HairmenuDTO> menuInfo(Map map);
  
  int enrollInput(Map map);
  
  HairmenuDTO menunoGet(Map map);
  
  List<EnrollDTO> enrollList(String did);
}
