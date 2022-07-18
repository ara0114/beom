package com.study.reservation;

public class EnrollDTO {
  private int enrollno;
  private String date;
  private String time;
  private int menuno;
  private int eprice;
  private String emenu;
  private String did;
  @Override
  public String toString() {
    return "EnrollDTO [enrollno=" + enrollno + ", date=" + date + ", time=" + time + ", menuno=" + menuno + ", eprice="
        + eprice + ", emenu=" + emenu + ", did=" + did + "]";
  }
}
