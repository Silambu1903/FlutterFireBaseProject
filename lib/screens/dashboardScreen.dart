import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/customDesign/bottomBar.dart';

class Dashboard extends StatefulWidget {
  static String id = "/dashboard";
  static String userName = "";

  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser);
      Dashboard.userName = loggedInUser.displayName.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
      bottomNavigationBar: BottomBar(),
    );
  }
}

Future<String> getFileData() async {
  return await new Future(() => Dashboard.userName);
}
