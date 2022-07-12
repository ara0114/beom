package com.study.style;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.style.StyleServiceImpl")
public class StyleServiceImpl implements StyleService {
  
  @Autowired
  private StyleMapper mapper;
  
  @Override
  public int create(StyleDTO dto) {
    return mapper.create(dto);
  }

}
