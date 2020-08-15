import 'package:flutter/material.dart';
import '../views/Countries_page.dart';
import '../views/Global_page.dart';
import '../models/GlobalCovid.dart';
import '../models/CountryCovid.dart';

class HomePages extends StatelessWidget {
  GlobalCovid globalCovid ;
  List<Country> listCountry = [];
  HomePages({
   this.globalCovid,
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
      home: MyApp(globalCovid: globalCovid, listCountry: listCountry,),
    );
  }
}

class MyApp extends StatefulWidget {
  GlobalCovid globalCovid ;
  List<Country> listCountry = [];
  MyApp({
    this.globalCovid,
    this.listCountry
  });
  @override
  _MyAppState createState() => _MyAppState(globalCovid: globalCovid, listCountry: listCountry);
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  String appbarTitle = 'Bottom navigator bar';
  TabController _tabController;
  GlobalCovid globalCovid ;
  List<Country> listCountry = [];
  _MyAppState({
    this.globalCovid,
    this.listCountry
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          GlobalPage(globalCovid: globalCovid,),
          Countries(listCountry: listCountry,)
        ],
      ),
      bottomNavigationBar: Container(
        //padding: EdgeInsets.all(16.0),
        child: ClipRRect(
          child: Container(
            color: Colors.blueGrey.withOpacity(0.5),
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.white,
              labelColor: Color(0xFFC41A3B),
              labelStyle: TextStyle(fontSize: 12),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide.none,
                insets:  EdgeInsets.fromLTRB(50, 0, 50, 40),
              ),
              indicatorColor: Colors.black54,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.public, size: 40,),
                ),
                Tab(
                  icon: Icon(Icons.account_balance, size: 40,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
