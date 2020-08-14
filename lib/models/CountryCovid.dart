import 'package:flutter/material.dart';

class Country{
  final String CountryName;
  final String CountryCode;
  final String Slug;
  final int NewConfirmed;
  final int TotalConfirmed;
  final int NewDeaths;
  final int TotalDeaths;
  final int NewRecovered;
  final int TotalRecoverd;

  Country({
    @required this.CountryName,
    @required this.CountryCode,
    @required this.Slug,
    @required this.NewConfirmed,
    @required this.NewDeaths,
    @required this.NewRecovered,
    @required this.TotalDeaths,
    @required this.TotalConfirmed,
    @required this.TotalRecoverd,
  });

  // ignore: missing_return
  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
        CountryCode: json['CountryCode'],
        CountryName: json['Country'],
        Slug: json['Slug'],
        NewConfirmed: json['NewConfirmed'],
        NewDeaths:  json['NewDeaths'],
        NewRecovered  :  json['NewRecovered'],
        TotalConfirmed:  json['TotalConfirmed'],
        TotalDeaths: json['TotalDeaths'],
        TotalRecoverd:  json['TotalRecovered']
    );
  }
}