package com.study.user;

import java.util.Map;

public interface UserMapper {

  int create(UserDTO dto);
  
  int duplicatedId(String id);
  
  int duplicatedEmail(String email);
  
  int loginCheck(Map<String, String> map);
  
  Map getGrade(String id);
  
  String findId(Map<String, String> map);
  
  String findPw(Map<String, String> map);
  
}
