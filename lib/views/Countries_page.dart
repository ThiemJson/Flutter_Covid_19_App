
import 'package:flutter/material.dart';
import 'package:ncov_app/models/CountryCovid.dart';
import 'package:ncov_app/models/ListCountry.dart';
import '../controllers/config.dart';

class Countries extends StatelessWidget {
  List<Country> listCountry;
  Countries({
    this.listCountry
  });
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
      home: MyApp(listCountry: listCountry,),
    );
  }
}

class MyApp extends StatefulWidget {
  List<Country> listCountry;
  MyApp({
  this.listCountry
  });
  @override
  _MyAppState createState() => _MyAppState(listCountry: listCountry);
}

class _MyAppState extends State<MyApp> {
  List<Country> listCountry;
  _MyAppState({
    this.listCountry
  });
  @override
  Widget build(BuildContext context) {
    Screen SCREEN = new Screen(context);
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xFFC41A3B),
          ),
          child: LimitedBox(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height*0.5,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only( left: 30),
                      child: Text('Quốc gia ', style: TextStyle( color: Colors.white, fontSize: Screen.MainTitle - 25, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          image: DecorationImage(
                            image: NetworkImage('https://d18lkz4dllo6v2.cloudfront.net/cumulus_uploads/entry/2020-04-06/COVID%20Getty%20Image.jpg?w=660',
                            ),
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,

                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 40,
                            left: 35,
                            right: 30
                          ),
                          child: ListView.builder(
                              itemCount: listCountry.length,
                              itemBuilder: (context, index)=>CardCountry(
                                color: (index % 2== 0)?Colors.blue:Colors.lightGreen,
                                CountryName: listCountry[index].CountryName,
                                NewConfirmed: listCountry[index].NewConfirmed,
                                NewDeaths: listCountry[index].NewDeaths,
                                NewRecovered: listCountry[index].NewRecovered,
                                TotalConfirmed: listCountry[index].TotalConfirmed,
                                TotalDeaths: listCountry[index].TotalDeaths,
                                TotalRecoverd: listCountry[index].TotalRecoverd
                              )
                          ),
                        ),
                      ),
                    ),
                  )
                ]
            ),
          )
        ),
      ),
    );
  }
}

class CardCountry extends StatelessWidget {
  final Color color;
  final String CountryName;
  final int NewConfirmed;
  final int TotalConfirmed;
  final int NewDeaths;
  final int TotalDeaths;
  final int NewRecovered;
  final int TotalRecoverd;

  const CardCountry({
    Key key,
    @required this.color,
    @required this.CountryName,
    @required this.NewConfirmed,
    @required this.NewDeaths,
    @required this.NewRecovered,
    @required this.TotalDeaths,
    @required this.TotalConfirmed,
    @required this.TotalRecoverd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen SCREEN = Screen(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.75),
          borderRadius: BorderRadius.circular(24)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            isThreeLine: true,
            title: Text(CountryName, style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: Screen.CountryTitleName ),),
            subtitle: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.airline_seat_individual_suite, color: Colors.white, size: Screen.CountryIcon,),
                        SizedBox(width: 8,),
                        Text('Nhiễm: ', style: TextStyle(color: Colors.white, fontSize: Screen.CountryInf),),
                        SizedBox(width: 8,),
                        Text('${this.NewConfirmed} - ${this.TotalConfirmed}', style: TextStyle(color: Colors.white, fontSize: Screen.CountryInf),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.cancel, color: Colors.white, size: Screen.CountryIcon,),
                        SizedBox(width: 8,),
                        Text('Tử vong: ', style: TextStyle(color: Colors.white, fontSize: Screen.CountryInf),),
                        SizedBox(width: 8,),
                        Text('${this.NewDeaths} - ${this.TotalDeaths}', style: TextStyle(color: Colors.white, fontSize: Screen.CountryInf),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.beenhere, color: Colors.white, size: Screen.CountryIcon,),
                        SizedBox(width: 8,),
                        Text('Hồi phục: ', style: TextStyle(color: Colors.white, fontSize: Screen.CountryInf),),
                        SizedBox(width: 8,),
                        Text('${this.NewRecovered} - ${this.TotalRecoverd}', style: TextStyle(color: Colors.white, fontSize: Screen.CountryInf),)
                      ],
                    ),
                  ),

                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
