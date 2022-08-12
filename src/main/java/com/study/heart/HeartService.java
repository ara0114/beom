package com.study.heart;

import java.util.Map;

import com.study.designer.DesignerDTO;

public interface HeartService {

  int selectCheck(HeartDTO dto);

  int addCheck(Map map);

  HeartDTO read(Map map);

  void heartPlus(Map map);

  void checkPlus(Map map);

  void heartMinus(Map map);

  void checkMinus(Map map);

}
