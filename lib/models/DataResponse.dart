import 'package:flutter/material.dart';
import 'GlobalCovid.dart';
import 'CountryCovid.dart';
import 'Time.dart';

class DataResponse{
  final Map<String, dynamic> dataResponseGlobal;
  final List<dynamic> dataResponseCountry;
  final String dataResponseTime;

  DataResponse({
    @required this.dataResponseCountry,
    @required this.dataResponseGlobal,
    @required this.dataResponseTime,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json){
    return DataResponse(
        dataResponseCountry: json['Countries'],
        dataResponseGlobal: json['Global'],
        dataResponseTime: json['Date'].toString(),
    );
  }
}