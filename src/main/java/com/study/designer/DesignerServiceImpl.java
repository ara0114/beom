package com.study.designer;

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
  public int lcreate(LicenseDTO ldto) {
    // TODO Auto-generated method stub
    return mapper.lcreate(ldto);
  }

}
