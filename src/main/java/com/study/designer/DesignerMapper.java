package com.study.designer;

import java.util.Map;

public interface DesignerMapper {

  int dcreate(DesignerDTO ddto);

  int lcreate1(LicenseDTO ldto);
  
  int lcreate2(LicenseDTO ldto);

  int duplicatedId(String id);

  int duplicatedEmail(String email);

  int dlogin(Map map);

  DesignerDTO dread(String did);

}
