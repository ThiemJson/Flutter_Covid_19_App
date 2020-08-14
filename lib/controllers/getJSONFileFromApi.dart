import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/DataResponse.dart';

Future<DataResponse> getJSONFileFormAPI() async {
  final response = await http.get('https://api.covid19api.com/summary');
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    //Map<String, dynamic> data = json.decode(response.body)['Global'];
    return DataResponse.fromJson(json.decode(response.body));
  } else {
    print("Fail");
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}