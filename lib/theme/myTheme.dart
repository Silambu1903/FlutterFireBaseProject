import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';
import 'package:flutterfirebaseapp/screens/dashboardScreen.dart';
import 'package:flutterfirebaseapp/screens/registerScreen.dart';
import 'package:flutterfirebaseapp/screens/loginScreen.dart';

class MyAppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: MyColors.primary,
          accentColor: MyColors.secondary,
          fontFamily: "Poppins",
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RegisterScreen.id,
        routes: <String, WidgetBuilder>{
          RegisterScreen.id: (BuildContext context) => new RegisterScreen(),
          LoginScreen.id: (BuildContext context) => new LoginScreen(),
          Dashboard.id: (BuildContext context) => new Dashboard(),
        });
  }
}
