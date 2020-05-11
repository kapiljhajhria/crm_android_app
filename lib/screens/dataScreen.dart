import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  List dataList;

  DataScreen({this.dataList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("You Have logged In"),),
    );
  }
}
