import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';

class UserListScreen extends StatefulWidget {
  static String id = "/userList";

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
  return SafeArea(
    child: GridView.count(
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return listItem(context);
      }),
    ),
  );
}

Widget listItem(BuildContext context) {
  return Stack(
    children: [
      Positioned(
        top: 30,
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 4,
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
      ),
      Positioned(
        top: 5,
        left: 0,
        right: 0,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: MyColors.secondary, width: 2.0),
          ),
          child: Container(
            margin: EdgeInsets.all(3),
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: MyColors.accent, width: 2.0),
            ),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/7/7e/Virat_Kohli.jpg',
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget list(BuildContext context) {
  return Stack(
    children: [
      Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: MyColors.primary,
          ),
        ),
      ),
    ],
  );
}
