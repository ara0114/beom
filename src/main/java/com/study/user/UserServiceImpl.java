package com.study.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.user.UserServiceImpl")
public class UserServiceImpl implements UserService {

  @Autowired
  private UserMapper mapper;
  
}
