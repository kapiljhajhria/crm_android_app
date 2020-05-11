import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ScrollController myScrollController;

  Widget formInputTextBox(String fieldName) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Center(
          child: TextField(
            style: TextStyle(fontSize: 26),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: fieldName,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintStyle:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      ),
    );
  }

  @override
  void initState() {
    myScrollController = ScrollController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(255, 122, 122, 1.0), BlendMode.color),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green,
            ),
          ),
          Container(
//              padding: EdgeInsets.fromLTRB(
//                  0,
//                  MediaQuery.of(context).size.height * .04,
//                  0,
//                  MediaQuery.of(context).size.height * .1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * .08,
                  MediaQuery.of(context).size.height * .1,
                  MediaQuery.of(context).size.width * .08,
                  MediaQuery.of(context).size.height * .1),
              child: Column(
                children: <Widget>[
                  formInputTextBox("Email"),
                  formInputTextBox("Password"),
                  GestureDetector(
                    onTap: () {

                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
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
                  Expanded(
                    flex: 1,
                    child: Container(
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
                                      color: Color.fromRGBO(185, 182, 211, 1.0),
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "Terms and Services",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
