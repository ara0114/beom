package com.study.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.user.UserServiceImpl")
public class UserServiceImpl implements UserService {

  @Autowired
  private UserMapper mapper;

  @Override
  public int create(UserDTO dto) {
    return mapper.create(dto);
  }

  @Override
  public int duplicatedId(String id) {
    return mapper.duplicatedId(id);
  }

  @Override
  public int duplicatedEmail(String email) {
    return mapper.duplicatedEmail(email);
  }

  @Override
  public int loginCheck(Map<String, String> map) {
    return mapper.loginCheck(map);
  }

  @Override
  public Map getGrade(String id) {
    return mapper.getGrade(id);
  }

  @Override
  public String findId(Map<String, String> map) {
    return mapper.findId(map);
  }

  @Override
  public String findPw(Map<String, String> map) {
    return mapper.findPw(map);
  }
  
}
