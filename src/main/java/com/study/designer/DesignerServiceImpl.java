package com.study.designer;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.designer.DesignerServiceImpl")
public class DesignerServiceImpl implements DesignerService {

  @Autowired
  private DesignerMapper mapper;
  
  
  @Override
  public int dcreate(DesignerDTO ddto) {
    // TODO Auto-generated method stub
    return mapper.dcreate(ddto);
  }

  @Override
  public int lcreate1(LicenseDTO ldto) {
    // TODO Auto-generated method stub
    return mapper.lcreate1(ldto);
  }

  @Override
  public int lcreate2(LicenseDTO ldto) {
    // TODO Auto-generated method stub
    return mapper.lcreate2(ldto);
  }

  @Override
  public int duplicatedId(String id) {
    // TODO Auto-generated method stub
    return mapper.duplicatedId(id);
  }

  @Override
  public int duplicatedEmail(String email) {
    // TODO Auto-generated method stub
    return mapper.duplicatedEmail(email);
  }

  @Override
  public int dlogin(Map map) {
    // TODO Auto-generated method stub
    return mapper.dlogin(map);
  }

  @Override
  public DesignerDTO dread(String did) {
    // TODO Auto-generated method stub
    return mapper.dread(did);
  }

}
