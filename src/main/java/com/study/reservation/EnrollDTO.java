package com.study.reservation;

import java.util.List;

import lombok.Data;

@Data
public class EnrollDTO {
  private int enrollno;
  private String enrolldate;
  private String enrolltime;
  private int menuno;
  private int eprice;
  private String emenu;
  private String did;
  
  private List<HairmenuDTO> hairmenu;


}
