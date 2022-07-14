package com.study.user;

import java.util.Map;

public interface UserService {

  int create(UserDTO dto);

  int duplicatedId(String id);

  int duplicatedEmail(String email);

  int loginCheck(Map<String, String> map);

  Map getGrade(String id);

  String findId(Map<String, String> map);

}
