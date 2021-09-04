import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
      child: Stack(),
    );
  }
}
