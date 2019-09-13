import 'package:flutter/material.dart';
import 'chartpie.dart';

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Text("Consommation en kw: 1.15 kw", style: TextStyle(fontSize: 20)),
        SizedBox(height: 30),
        Text("Emission de CO2: 460 gCO2e", style: TextStyle(fontSize: 20)),
        Expanded(child: DonutAutoLabelChart.withSampleData()),
        Text("7 smartphones rechargés", style: TextStyle(fontSize: 20)),
        SizedBox(height: 30),
        Text("2.71 kms en voiture", style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
