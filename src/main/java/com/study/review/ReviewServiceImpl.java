package com.study.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.review.ReviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {
  @Autowired
  private ReviewMapper mapper;

  @Override
  public List<ReviewDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int total(Map map) {
    // TODO Auto-generated method stub
    return mapper.total(map);
  }

  @Override
  public ReviewDTO read(int rno) {
    // TODO Auto-generated method stub
    return mapper.read(rno);
  }


}
