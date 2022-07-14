package com.study.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.notice.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {
  
  @Autowired
  private NoticeMapper mapper;


}
