import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';
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
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
