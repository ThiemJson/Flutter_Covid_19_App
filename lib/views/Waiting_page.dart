import 'package:flutter/material.dart';
import 'package:http/http.dart';import 'package:ncov_app/views/Global_page.dart';
import 'package:ncov_app/views/Home_Page.dart';
import '../controllers/getJSONFileFromApi.dart';
import '../models/DataResponse.dart';
import '../models/GlobalCovid.dart';
import '../models/CountryCovid.dart';
import '../models/Time.dart';
import '../controllers/config.dart';
import '../views/Countries_page.dart';
class Waiting_Page extends StatelessWidget {

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

  });
  }

  @override
  void initState() {
     super.initState();
     _futureDataResponse = getJSONFileFormAPI();
     _futureDataResponse.then( (_dataResponse) {
         _globalCovid =  GlobalCovid.fromJson(_dataResponse.dataResponseGlobal);
         for(int i = 0 ; i < _dataResponse.dataResponseCountry.length ; i ++ ){
           _listCountry.add(Country.fromJson(_dataResponse.dataResponseCountry[i]));
         }
         Navigator.of(context).push(
             MaterialPageRoute(
                 builder: (context) => HomePages(listCountry: _listCountry, globalCovid: _globalCovid,),
                 //builder: (context) => GlobalPage(globalCovid: _globalCovid,),
             )
         );
       });
     }

  @override
  Widget build(BuildContext context) {
    print("Height: ${MediaQuery.of(context).size.height}");
    print("Width: ${MediaQuery.of(context).size.width}");

    return Scaffold(
      backgroundColor: Color(0xFFC41A3B) ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('COVID-19',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60),),
              SizedBox(height: 20,),
              Text('-- Việt Nam chung tay quyết thắng đại dịch --',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic),),
            ],
          ),
        ),),
      );
  }
}

