

import 'package:flutter/material.dart';

class Screen {
  static double MainTitle ;
  static double   SubTitle;
  static double Number;
  static double CardTitle;
  static double paddingMainScreenTopRight;
  static double paddingMainScreenTopLeft;
  static double paddingCard;
  static double SubTitle2;
  static double CountryTitleName;
  static double CountryInf;
  static double CountryIcon;

  Screen(BuildContext context){
    double WIDTH = MediaQuery.of(context).size.width;
    double HEIGHT = MediaQuery.of(context).size.height;
    SubTitle = (WIDTH*HEIGHT)/11247.2816;
    SubTitle2 = (WIDTH*HEIGHT)/15621.2244;
    MainTitle = (WIDTH*HEIGHT)/5623.64078;
    Number = (WIDTH*HEIGHT)/11247.2816 ;
    CardTitle = (WIDTH*HEIGHT)/18745.4693;
    paddingMainScreenTopLeft = (WIDTH*HEIGHT)/9372.7343;
    paddingMainScreenTopRight = (WIDTH*HEIGHT)/3514.77549;
    paddingCard = (WIDTH*HEIGHT)/28118.2039;
    CountryInf = (WIDTH*HEIGHT)/14059.1;
    CountryIcon = (WIDTH*HEIGHT)/9372.7333;
    CountryTitleName = (WIDTH*HEIGHT)/9372.7333;

  }
}