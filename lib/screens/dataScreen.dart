import 'package:flutter/material.dart';

import '../netwrok-helper.dart';

class DataScreen extends StatefulWidget {
  Session session;

  DataScreen({this.session});

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  Session session;
  List dataList = [];

  fetchFormData() async {
    var r = await session.get("http://10.0.2.2:5000/customers");
    print("fetched customer data list");
    dataList = r;
    setState(() {});
  }

  @override
  void initState() {
    session = widget.session;
    fetchFormData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Table"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          ),
        ],
      ),
      body: dataList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[],
            ),
    );
  }
}
