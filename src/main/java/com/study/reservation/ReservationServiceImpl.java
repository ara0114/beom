package com.study.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.study.reservation.ReservationServiceImpl")
public class ReservationServiceImpl implements ReservationService {
  
  @Autowired
  private ReservationMapper mapper;
  
  @Override
  public List<HairmenuDTO> list(String did) {
    
    return mapper.list(did);
  }
  
}
