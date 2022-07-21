package com.study.designer;

import java.util.Map;

public interface DesignerService {

  int dcreate(DesignerDTO ddto);

  int lcreate1(LicenseDTO ldto);
  
  int lcreate2(LicenseDTO ldto);

  int duplicatedId(String id);

  int duplicatedEmail(String email);

  int dlogin(Map map);

  DesignerDTO dread(String did);

  String findId(Map<String, String> map);

  String findPw(Map<String, String> map);

}
