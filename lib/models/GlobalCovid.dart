import 'package:flutter/material.dart';

class GlobalCovid{
  final int NewConfirmed;
  final int TotalConfirmed;
  final int NewDeaths;
  final int TotalDeaths;
  final int NewRecovered;
  final int TotalRecoverd;

  GlobalCovid({
    @required this.NewConfirmed,
    @required this.NewDeaths,
    @required this.NewRecovered,
    @required this.TotalDeaths,
    @required this.TotalConfirmed,
    @required this.TotalRecoverd,
  });

  // ignore: missing_return
  factory GlobalCovid.fromJson(Map<String, dynamic> json){
    return GlobalCovid(
        NewConfirmed: json['NewConfirmed'],
        NewDeaths:  json['NewDeaths'],
        NewRecovered  :  json['NewRecovered'],
        TotalConfirmed:  json['TotalConfirmed'],
        TotalDeaths: json['TotalDeaths'],
        TotalRecoverd:  json['TotalRecovered']
    );
  }
}