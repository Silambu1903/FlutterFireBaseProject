import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';

class UserListScreen extends StatefulWidget {
  static String id = "/userList";

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final _auth = FirebaseAuth.instance;
  dynamic _list;
  dynamic url = "";
  final firestore = FirebaseFirestore.instance;
  dynamic userList;

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    if (user != null) {}
  }

  @override
  void initState() {
    getCurrentUser();
    getMembers();
    super.initState();
  }

  void getMembers() async {
    await for (var snapshots in firestore.collection("UserData").snapshots()) {
      for (var members in snapshots.docs) {
        print(members.get("about"));
        print(members.get("dob"));
        print(members.get("email"));
        print(members.get("gender"));
        print(members.get("name"));
        url = members.get("profile");
        print(members.get("profile"));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userListItem(context, url),
    );
  }
}

Widget userListItem(BuildContext context, dynamic url) {
  return SafeArea(
    child: ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Item(context);
      },
    ),
  );
}

Widget listItem(BuildContext context, dynamic url) {
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
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "username : ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.035),
                      ),
                      Text(
                        "silambu ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.035),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Gender : ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.035),
                      ),
                      Text(
                        "Male ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.035),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: MaterialButton(
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          color: MyColors.secondary,
                          child: Text(
                            "Add Friend",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
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
                  "https://firebasestorage.googleapis.com/v0/b/fluttersocialchat-73c72.appspot.com/o/images%2FsilambuprofilePic?alt=media&token=4970f93f-775d-4b50-afac-08f1a2193b9f",
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.08,
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

Widget Item(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 15, 10, 0),
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundImage: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/fluttersocialchat-73c72.appspot.com/o/images%2FsilambuprofilePic?alt=media&token=4970f93f-775d-4b50-afac-08f1a2193b9f'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(12.0, 15, 10, 0),
                            child: Text(
                              "silambarasan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                            child: Text(
                              "Mobile App developer",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.025,
                        height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1.0, 10, 0, 0),
                        child: Text(
                          "online",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: MyColors.secondary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                    child: Text(
                      "9.2",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 2, 10, 0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.white, width: 3.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10, 10, 0),
                    child: Text(
                      "12345",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.015),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 2, 10, 0),
                    child: Text(
                      "reviews",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.013),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
