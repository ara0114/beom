package com.study.enroll;

import java.util.List;

import lombok.Data;

@Data
public class HairmenuDTO {
  private int menuno;
  private int price;
  private String menu;
  private String did;
  private String hgender;
  private int cateno;
  
  private List<CategoryDTO> category;
  
}
