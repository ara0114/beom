package com.study.hairmenu;

import java.util.List;
import java.util.Map;

public interface HairmenuMapper {

  List<HairmenuDTO> list(Map map);
  
  int hairmenuEnroll(HairmenuDTO dto);
}
