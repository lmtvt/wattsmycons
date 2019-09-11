import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'MoskNormal400.ttf'),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
                'Wattsmycons',
                style: TextStyle(color: Color(0xFF120E4C), fontSize: 25),
              ),
          ),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  State createState() => HomePageState();
}
