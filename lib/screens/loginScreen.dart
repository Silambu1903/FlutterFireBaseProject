import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';
import 'package:flutterfirebaseapp/theme/myTheme.dart';

void main() {
  runApp(MyAppTheme());
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Center(
                          child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                    ),
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: MyColors.accent, width: 2.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      "Log in",
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 0,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        "Sign up with one of following options.",
                        style: TextStyle(color: MyColors.ash),
                      ),
                    )
                  ],
                )),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Card(
                        margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // if you need this
                          side: BorderSide(
                            color: MyColors.accent,
                            width: 2.0,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.primary,
                            border:
                                Border.all(color: MyColors.accent, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Container(
                            child: Center(
                              child: Image.asset(
                                "assets/google.png",
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.035,
                                scale: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // if you need this
                        side: BorderSide(
                          color: MyColors.accent,
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColors.primary,
                          border:
                              Border.all(color: MyColors.accent, width: 2.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Container(
                          child: Center(
                            child: Image.asset(
                              "assets/apple.png",
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 0,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 15, 5, 0),
                      child: Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: new InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyColors.accent, width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyColors.secondary, width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: '  silambu',
                              hintStyle: TextStyle(color: MyColors.accent)),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 0,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white),
                          decoration: new InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.accent, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.secondary, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            hintText: '  silambu@gmail.com',
                            hintStyle: TextStyle(color: MyColors.accent),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 0,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0),
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: new InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyColors.accent, width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyColors.secondary, width: 2.0),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: '  123456',
                              hintStyle: TextStyle(color: MyColors.accent)),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      color: MyColors.secondary,
                      child: Text("Create Account"),
                      textColor: Colors.white,
                    ),
                  ))
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          child: Text(
                            "Already have an account? Log in",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
