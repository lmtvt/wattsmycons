import 'package:flutter/material.dart';
import 'chartpie.dart';

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: DonutAutoLabelChart.withSampleData()),
      ],
    );
  }
}
