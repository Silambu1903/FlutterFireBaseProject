import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';
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
      final userId = user.uid;
      loggedInUser = user;
      print(loggedInUser.displayName);
      print(userId.toString());
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.85,
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomBar(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.77,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.secondary,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> getFileData() async {
  return await new Future(() => Dashboard.userName);
}
