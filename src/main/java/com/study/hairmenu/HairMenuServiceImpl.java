package com.study.hairmenu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.hairmenu.HairMenuServiceImpl")
public class HairMenuServiceImpl implements HairMenuService {
  @Autowired
  private HairMenuMapper mapper;

  


}
