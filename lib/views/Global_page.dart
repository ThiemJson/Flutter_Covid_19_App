import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ncov_app/views/Home_page.dart';
import '../models/GlobalCovid.dart';
import '../models/CountryCovid.dart';

class GlobalPage extends StatelessWidget {
  GlobalCovid globalCovid ;


  GlobalPage({this.globalCovid});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Views',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyApp(globalCovid: globalCovid,),
    );
  }
}

class MyApp extends StatefulWidget {
  GlobalCovid globalCovid ;
  MyApp({this.globalCovid});
  @override
  _MyAppState createState() => _MyAppState(globalCovid: globalCovid);
}

class _MyAppState extends State<MyApp> {
  String NewConfirmed = "120000";
  String NewDeaths = '12000';
  String NewRecoverd = '120000';
  String TotalConfirmed = '19012121';
  String TotalDeaths = '2650320';
  String TotalRecoverd = '1200000';

  GlobalCovid globalCovid ;
  _MyAppState({this.globalCovid});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      NewConfirmed = globalCovid.NewConfirmed.toString() ?? "Loading...";
      NewDeaths = globalCovid.NewDeaths.toString() ?? "Loading...";
      NewRecoverd = globalCovid.NewRecovered.toString() ?? "Loading...";
      TotalRecoverd = globalCovid.TotalRecoverd.toString() ?? "Loading...";
      TotalConfirmed = globalCovid.TotalConfirmed.toString() ?? "Loading...";
      TotalDeaths = globalCovid.TotalDeaths.toString() ?? "Loading...";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFC41A3B),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 30),
                child: Text('Covid-19', style: TextStyle( color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only( left: 30),
                child: Text('Toàn thế giới ', style: TextStyle( color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only( left: 30),
                child: Text('Cập nhật lần cuối: ', style: TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://vimed.org/wp-content/uploads/2020/07/dich-covid-19.jpg',),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        topLeft: Radius.circular(30),
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height*0.5,
                            child: GridView.count(
                                crossAxisCount: 2,
                                scrollDirection: Axis.vertical,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Card(
                                    shadowColor: Color(0xFFC41A3B),
                                    elevation: 12,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(color: Color(0xFFC41A3B), width: 0.2, style: BorderStyle.none)
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Số ca nhiễm mới',
                                            style: TextStyle(
                                                color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: 15),
                                          ),
                                          Text(NewConfirmed, style: TextStyle(fontSize: 25, color:Colors.red , fontWeight: FontWeight.bold),),
                                          SizedBox(height: 15,),
                                          Text('Tổng số ca nhiễm', style: TextStyle(color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: 15),),
                                          Text(TotalConfirmed, style: TextStyle(fontSize: 22, color:Colors.red , fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Card(
                                    shadowColor: Color(0xFFC41A3B),
                                    elevation: 12,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        side: BorderSide(color: Color(0xFFC41A3B), width: 0.2, style: BorderStyle.none)
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Số ca tử vong mới',
                                            style: TextStyle(
                                                color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: 15),
                                          ),
                                          Text( NewDeaths, style: TextStyle(fontSize: 25, color:Color(0xFFC41A3B) , fontWeight: FontWeight.bold),),
                                          SizedBox(height: 15,),
                                          Text('Tổng số ca tử vong', style: TextStyle(color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: 15),),
                                          Text(TotalDeaths, style: TextStyle(fontSize: 22, color:Color(0xFFC41A3B) , fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                LimitedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      shadowColor: Color(0xFFC41A3B),
                                      elevation: 12,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                          side: BorderSide(color: Color(0xFFC41A3B), width: 0.2, style: BorderStyle.none)
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Số ca hồi phục mới',
                                              style: TextStyle(
                                                  color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: 15),
                                            ),
                                            Text(NewRecoverd, style: TextStyle(fontSize: 25, color:Colors.green , fontWeight: FontWeight.bold),),
                                            SizedBox(height: 15,),
                                            Text('Tổng số ca hồi phục', style: TextStyle(color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: 15),),
                                            Text(TotalRecoverd, style: TextStyle(fontSize: 22, color:Colors.green , fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
