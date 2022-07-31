package com.study.hairmenu;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.hairmenu.HairmenuServiceImpl")
public class HairmenuServiceImpl implements HairmenuService {
  @Autowired
  private HairmenuMapper mapper;

  @Override
  public List<HairmenuDTO> list(Map map) {
    // TODO Auto-generated method stub
    return mapper.list(map);
  }

  @Override
  public int hairmenuEnroll(HairmenuDTO dto) {
    // TODO Auto-generated method stub
    return mapper.hairmenuEnroll(dto);
  }


  @Override
  public List<HairmenuDTO> itemlist(int cateno) {
    // TODO Auto-generated method stub
    return mapper.itemlist(cateno);
  }

  @Override
  public int delete(int menuno) {
    // TODO Auto-generated method stub
    return mapper.delete(menuno);
  }


  


}
