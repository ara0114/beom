package com.study.review;

import java.util.List;
import java.util.Map;

public interface ReviewMapper {

  List<ReviewDTO> list(Map map);
  int total(Map map);
  ReviewDTO read(int rno);
}
