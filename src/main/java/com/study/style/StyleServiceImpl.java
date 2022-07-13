package com.study.style;

import java.util.List;

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

  @Override
  public List<StyleDTO> list(String gender) {

    return mapper.list(gender);
  }

  @Override
  public int delete(int imageno) {
    return mapper.delete(imageno);
  }

}
