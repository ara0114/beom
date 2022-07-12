package com.study.user;

public interface UserService {

  int create(UserDTO dto);

  int duplicatedId(String id);

  int duplicatedEmail(String email);

}
