import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getFileData(),
          builder: (BuildContext context, AsyncSnapshot<String> text) {
            return new Text(text.data ?? "");
          },
        ),
      ),
    );
  }
}

Future<String> getFileData() async {
  return await new Future(() => Dashboard.userName);
}
