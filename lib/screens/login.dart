import 'dart:convert';
import 'package:crmandroidapp/screens/dataScreen.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import '../netwrok-helper.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ScrollController myScrollController;
  TextEditingController emailController;
  TextEditingController pwdController;
  Session session;

  Widget formInputTextBox(
      String fieldName, TextEditingController txtController) {
    return Container(
      child: Center(
        child: TextField(
          controller: txtController,
          style: TextStyle(fontSize: 26),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: fieldName,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              hintStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    );
  }

  void _showDialog(alertMsg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Warning"),
          content: new Text(alertMsg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  logInUser() async {
    String alertMsg = "";
    if (emailController.text.length == 0) {
      alertMsg = "Please enter an email id";
    }

    if (pwdController.text.length == 0)
      alertMsg = alertMsg + "\n Please enter your password";
    if (alertMsg.length != 0) {
      _showDialog(alertMsg);
      return;
    }
    Map dataMap = {"email": emailController.text, "pswd": pwdController.text};
    Map jsonMap = await session.post('http://10.0.2.2:5000/login', dataMap);
    if (jsonMap["result"] == "noEmail") {
      alertMsg = "Email id doesn't exist, please sign up first";
    } else if (jsonMap["result"] == "passwordError") {
      alertMsg = "wrong password, please check your password";
    } else if (jsonMap["result"] == "loggedIn") {
      // alertMsg="loggedIN"
//      alertMsg = "logged In";
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DataScreen(
                  session: session,
                )),
      );
    }

    if (alertMsg.length != 0) {
      _showDialog(alertMsg);
      return;
    }
  }

  fetchFormData() async {
    var r = await session.get("http://10.0.2.2:5000/customers");
    print("fetched customer data list");
    print(r);
  }

  @override
  void initState() {
    emailController = TextEditingController();
    pwdController = TextEditingController();
    myScrollController = ScrollController();
    session = Session();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Use the Best CRM to grow your business",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Card(
                    elevation: 10,
//                    margin: EdgeInsets.only(top: 40,bottom: 40),
//                  margin: EdgeInsets.all(5),
                    color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(fontSize: 35, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        formInputTextBox("Email", emailController),
                        formInputTextBox("Password", pwdController),
                        GestureDetector(
                          onTap: () async {
                            await logInUser();
//                      fetchFormData();
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              color: Color.fromRGBO(56, 204, 140, 1.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.green,
                                    offset: Offset(0, 4.0),
                                    spreadRadius: 0.0)
                              ],
                            ),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: MediaQuery.of(context).size.height * 0.09,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Center(
                              child: Text(
                                "LogIn",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    wordSpacing: 2),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.60,
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment(1, -0.4),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'By clicking the button, you are agreeing to our  ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(
                                              185, 182, 211, 1.0),
                                          fontWeight: FontWeight.w400)),
                                  TextSpan(
                                      text: "Terms and Services",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
