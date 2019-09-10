import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              title: Center(
                  child: Text(
            'Wattsmycons',
            style: TextStyle(fontFamily: 'MoskNormal400.ttf'),
          )),),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  State createState() => HomePageState();
}
