package com.study.reservation;

import java.util.List;
import java.util.Map;
import java.util.Set;

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

  // 디자이너별 등록된 카테고리리스트를 가지고옵니다.
  @Override
  public Set<CategoryDTO> catenameList(String did) {
    return mapper.catenameList(did);
  }

  // 디자이너별 등록된 menu,price를 가지고옵니다.
  @Override
  public List<HairmenuDTO> menuPriceList(String did) {

    return mapper.menuPriceList(did);
  }
 
  @Override
  public List<HairmenuDTO> menuInfo(Map map) {
    return mapper.menuInfo(map);
  }
  
  //예약테이블에 예약등록
  @Override
  public int enrollInput(Map map) {
    return mapper.enrollInput(map);
  }
  //enroll 에insert 하기전에 시술명으로  해당 hairmenu 에 menuno 를 갖고온다
  @Override
  public HairmenuDTO menunoGet(Map map) {
    
    return mapper.menunoGet(map);
  }

  @Override
  public Set<EnrollDTO> enrollList(String did) {
    
    return mapper.enrollList(did);
  }

  @Override
  public int enrollDelete(int enrollno) {
    
    return mapper.enrollDelete(enrollno);
  }



}
