import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    child: GridView.count(
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return listItem(context, url);
      }),
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
                mainAxisAlignment: MainAxisAlignment.s,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
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
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.06,
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
