import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userListItem(context),
    );
  }
}

Widget userListItem(BuildContext context) {
  return Stack(
    children: [

      Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 4,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,

        left: 0,
        right: 0,
        child:Container(),
      ),
    ],
  );
}


