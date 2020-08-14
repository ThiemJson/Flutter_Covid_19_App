import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ncov_app/views/Global_page.dart';
import '../controllers/getJSONFileFromApi.dart';
import '../models/DataResponse.dart';
import '../models/GlobalCovid.dart';
import '../models/CountryCovid.dart';
import '../models/Time.dart';
class Home_Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home page',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String appbarTitle = 'Home page';
  Future<DataResponse> _futureDataResponse;
  GlobalCovid _globalCovid ;
  List<Country> _listCountry = [];

  void getData() {
    _futureDataResponse = getJSONFileFormAPI();
    _futureDataResponse.then( (_dataResponse){
      _globalCovid =  GlobalCovid.fromJson(_dataResponse.dataResponseGlobal);
      for(int i = 0 ; i < _dataResponse.dataResponseCountry.length ; i ++ ){
        _listCountry.add(Country.fromJson(_dataResponse.dataResponseCountry[i]));
      }
  });
  }

  @override
  void initState() {
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Press me! "),
          onPressed: () async{
             _futureDataResponse = getJSONFileFormAPI();

          },
        ),
      ),
    );
  }
}

