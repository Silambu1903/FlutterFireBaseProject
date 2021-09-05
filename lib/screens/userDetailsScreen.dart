import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';

class UserDetails extends StatefulWidget {
  static String id = "/userDetails";

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height*0.25,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: MyColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
