package com.study.heart;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.designer.DesignerDTO;

@Service("com.study.heart.HeartServiceImpl")
public class HeartServiceImpl implements HeartService {
  @Autowired
  private HeartMapper mapper;

  @Override
  public DesignerDTO plusheart(String did) {
    // TODO Auto-generated method stub
    return mapper.plusheart(did);
  }



}
