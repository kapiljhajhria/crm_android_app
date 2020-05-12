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

  logOutUser() async {
    print("logging out user");
    var result = await session.post("http://10.0.2.2:5000/logout", {
      "reqType": "log me out",
    });

    if (result["status"] == "loggedOut") {
      Navigator.pop(context);
    } else {}
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
            onPressed: () {
              dataList.clear();
              setState(() {});
              fetchFormData();
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              logOutUser();
            },
          ),
        ],
      ),
      body: dataList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  elevation: 6,
                  child: ListTile(
                    title: Text(
                      dataList[index]["name"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    isThreeLine: true,
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(dataList[index]["gender"]),
                        Text(dataList[index]["_id"]),
                      ],
                    ),
                    trailing: Text(dataList[index]["contact"]),
                  ),
                );
              }),
    );
  }
}
