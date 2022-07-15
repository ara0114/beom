package com.study.reservation;

import java.util.List;
import java.util.Set;

public interface ReservationService {

  List<HairmenuDTO> list(String did);

  Set<CategoryDTO> catenameList(String did);

  List<HairmenuDTO> menuPriceList(String did);

}
