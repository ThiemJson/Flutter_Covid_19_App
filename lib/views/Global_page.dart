import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ncov_app/views/Waiting_page.dart';
import '../models/GlobalCovid.dart';
import '../models/CountryCovid.dart';
import '../controllers/config.dart';
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
    Screen SCREEN = new Screen(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xFFC41A3B),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only( left: 30),
                  child: Text('Toàn thế giới ', style: TextStyle( color: Colors.white, fontSize: Screen.MainTitle - 25, fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://d18lkz4dllo6v2.cloudfront.net/cumulus_uploads/entry/2020-04-06/COVID%20Getty%20Image.jpg?w=660',
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomLeft,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(/*Screen.paddingMainScreenTopRight*/ 40),
                        topLeft: Radius.circular(/*Screen.paddingMainScreenTopLeft*/ 40),
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
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
                                color: Colors.white70.withOpacity(0.6),
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
                                            color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: Screen.CardTitle),
                                      ),
                                      Text(NewConfirmed, style: TextStyle(fontSize: Screen.Number, color:Colors.red , fontWeight: FontWeight.bold),),
                                      SizedBox(height: 15,),
                                      Text('Tổng số ca nhiễm', style: TextStyle(color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: Screen.CardTitle),),
                                      Text(TotalConfirmed, style: TextStyle(fontSize: Screen.Number, color:Colors.red , fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                shadowColor: Color(0xFFC41A3B),
                                elevation: 12,
                                color:  Colors.white70.withOpacity(0.6),
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
                                            color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: Screen.CardTitle),
                                      ),
                                      Text( NewDeaths, style: TextStyle(fontSize: Screen.Number, color:Color(0xFFC41A3B) , fontWeight: FontWeight.bold),),
                                      SizedBox(height: 15,),
                                      Text('Tổng số ca tử vong', style: TextStyle(color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: Screen.CardTitle),),
                                      Text(TotalDeaths, style: TextStyle(fontSize: Screen.Number, color:Color(0xFFC41A3B) , fontWeight: FontWeight.bold),),
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
                                  color:  Colors.white70.withOpacity(0.6),
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
                                              color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: Screen.CardTitle),
                                        ),
                                        Text(NewRecoverd, style: TextStyle(fontSize: Screen.Number, color:Colors.green , fontWeight: FontWeight.bold),),
                                        SizedBox(height: 15,),
                                        Text('Tổng số ca hồi phục', style: TextStyle(color: Colors.black87 , fontWeight: FontWeight.bold, fontSize: Screen.CardTitle),),
                                        Text(TotalRecoverd, style: TextStyle(fontSize: Screen.Number, color:Colors.green , fontWeight: FontWeight.bold),),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
