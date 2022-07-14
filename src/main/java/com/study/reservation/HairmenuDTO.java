package com.study.reservation;

import java.util.List;

import lombok.Data;

@Data
public class HairmenuDTO {
  private int menuno;
  private int price;
  private String menu;
  private String did;
  private int cateno;
  
  private List<CategoryDTO> category;
  
}
