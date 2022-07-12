package com.study.user;

public interface UserMapper {

  int create(UserDTO dto);
  
  int duplicatedId(String id);
  
  int duplicatedEmail(String email);
}
