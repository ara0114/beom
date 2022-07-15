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
    // TODO Auto-generated method stub
    return mapper.menuInfo(map);
  }

  // 디자이너의 성별에 맞는 메뉴와 가격을 가지고옵니다.
 

}
