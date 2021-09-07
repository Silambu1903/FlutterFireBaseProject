import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';
import 'package:flutterfirebaseapp/screens/registerScreen.dart';
import 'package:flutterfirebaseapp/screens/userDetailsScreen.dart';
import 'dashboardScreen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "/register";
  static String email = "";
  static String password = "";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primary,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  backArrow(context),
                  textLogin(context, 'Login up with one of following options.',
                      MyColors.ash, 0.015),
                  rowCard(context),
                  textLogin(context, 'Email', Colors.white, 0.032),
                  textFiled(context, 'silambu@gmail.com', 0),
                  textLogin(context, 'Password', Colors.white, 0.032),
                  textFiled(context, '123456', 1),
                  loginButton(context, "Login", _auth),
                  registerText(context, "Don't have an Account Signup here!")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget backArrow(BuildContext context) {
  return Row(
    children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.height * 0.07,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RegisterScreen.id);
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
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
          "Login",
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.04),
        ),
      ),
    ],
  );
}

Widget textLogin(BuildContext context, String text, Color colors, double size) {
  return Row(
    children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Text(
          text,
          style: TextStyle(
              color: colors,
              fontWeight: FontWeight.normal,
              fontSize: MediaQuery.of(context).size.height * size),
        ),
      ),
    ],
  );
}

Widget rowCard(BuildContext context) {
  return Row(
    children: <Widget>[
      cardViewLogin(context, 'assets/google.png'),
      cardViewLogin(context, 'assets/apple.png'),
    ],
  );
}

Widget cardViewLogin(BuildContext context, String text) {
  return Container(
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // if you need this
        side: BorderSide(
          color: MyColors.accent,
          width: 2.0,
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: MyColors.primary,
          border: Border.all(color: MyColors.accent, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Container(
          child: Center(
            child: Image.asset(
              text,
              width: MediaQuery.of(context).size.width * 0.06,
              height: MediaQuery.of(context).size.height * 0.06,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget textFiled(BuildContext context, String text, int count) {
  if (count == 0) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10, right: 0, left: 20, bottom: 0),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.09,
          child: TextField(
            onChanged: (value) {
              LoginScreen.email = value;
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.white),
            decoration: new InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.accent, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.secondary, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: text,
                hintStyle: TextStyle(color: MyColors.accent)),
          ),
        ),
      ],
    );
  } else {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10, right: 0, left: 20, bottom: 0),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.09,
          child: TextField(
            onChanged: (value) {
              LoginScreen.password = value;
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.white),
            decoration: new InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.accent, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyColors.secondary, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: text,
                hintStyle: TextStyle(color: MyColors.accent)),
          ),
        ),
      ],
    );
  }
}

Widget loginButton(BuildContext context, String text, FirebaseAuth auth) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.07,
        child: RaisedButton(
          onPressed: () async {
            final user = await auth.signInWithEmailAndPassword(
                email: LoginScreen.email, password: LoginScreen.password);
            if (user != null) {
              Navigator.of(context).pushNamed(UserDetails.id);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Logged In'),
              ));
            }
          },
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
          color: MyColors.secondary,
          child: Text(text),
          textColor: Colors.white,
        ),
      ),
    ],
  );
}

Widget registerText(BuildContext context, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RegisterScreen.id);
          },
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.015),
          ),
        ),
      ),
    ],
  );
}
