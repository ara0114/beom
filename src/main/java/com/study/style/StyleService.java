package com.study.style;

import java.util.List;

public interface StyleService {
  int create(StyleDTO dto);

  List<StyleDTO> list(String gender);

  int delete(int imageno);
}
