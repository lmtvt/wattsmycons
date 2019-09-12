import 'package:flutter/material.dart';
import 'tab1.dart';
import 'tab2.dart';

class TabBarDemo extends StatelessWidget {
  Tab1 tab1 = Tab1();
  Tab2 tab2 = Tab2();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.cloud, color: Color(0xFF120E4C))),
                Tab(icon: Icon(Icons.apps, color: Color(0xFF120E4C))),
              ],
            ),
            title: Text('WattsMyCons', style: TextStyle(color: Color(0xFF120E4C)),),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              Tab1(),
              Tab2()
            ],
          ),
        ),
      ),
    );
  }
}