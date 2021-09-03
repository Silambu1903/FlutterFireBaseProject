import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';
import 'package:flutterfirebaseapp/screens/loginScreen.dart';
import 'package:flutterfirebaseapp/theme/myTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyAppTheme());
}

class RegisterScreen extends StatefulWidget {
  static String id = "/login";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  String email = "";
  String password = "";
  String userName = "";
  bool showProgress = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  bool _validate = false;

  bool validateTextField(String userInput, String text) {
    if (userInput.isEmpty) {
      setState(() {
        _validate = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(text),
        ));
      });
      return false;
    }
    setState(() {
      _validate = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.accent, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.04),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text(
                        "Sign up with one of following options.",
                        style: TextStyle(color: MyColors.ash),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // if you need this
                          side: BorderSide(
                            color: MyColors.accent,
                            width: 2.0,
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            color: MyColors.primary,
                            border:
                                Border.all(color: MyColors.accent, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Container(
                            child: Center(
                              child: Image.asset(
                                "assets/google.png",
                                width: MediaQuery.of(context).size.width * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // if you need this
                          side: BorderSide(
                            color: MyColors.accent,
                            width: 2.0,
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            color: MyColors.primary,
                            border:
                                Border.all(color: MyColors.accent, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Container(
                            child: Center(
                              child: Image.asset(
                                "assets/apple.png",
                                width: MediaQuery.of(context).size.width * 0.06,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                      child: Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.03),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, right: 0, left: 20, bottom: 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: TextField(
                        controller: userNameController,
                        onChanged: (value) {
                          userName = value;
                        },
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: MyColors.accent, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.secondary, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: '  silambu',
                          hintStyle: TextStyle(color: MyColors.accent),
                          errorText:
                              _validate ? 'Please enter a Username' : null,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 5, 0),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.03),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, right: 0, left: 20, bottom: 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: TextField(
                        controller: userEmailController,
                        onChanged: (value) {
                          email = value;
                        },
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: MyColors.accent, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.secondary, width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: '  silambu@gmail.com',
                          hintStyle: TextStyle(color: MyColors.accent),
                          errorText: _validate ? 'Please enter a Email' : null,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 5, 0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.03),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, right: 0, left: 20, bottom: 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: TextField(
                        controller: userPasswordController,
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                        },
                        textInputAction: TextInputAction.done,
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.accent, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.secondary, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            hintText: '  123456',
                            errorText:
                                _validate ? 'Please enter a Password' : null,
                            hintStyle: TextStyle(color: MyColors.accent)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: RaisedButton(
                        onPressed: () async {
                          validateTextField(userNameController.text,
                              "Please Enter the User Name");
                          validateTextField(userEmailController.text,
                              "Please Enter the User Email");
                          validateTextField(userPasswordController.text,
                              "Please Enter the User Password");
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            final user = _auth.currentUser;
                            if (user != null) {
                              user.updateDisplayName(userName);
                            }
                            if (newUser != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Register Successfully '),
                              ));
                              Navigator.of(context).pushNamed(LoginScreen.id);
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                e.toString(),
                              ),
                            ));
                            // SnackBarPage(e.toString());
                          }
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                        color: MyColors.secondary,
                        child: Text("Create Account"),
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(LoginScreen.id);
                        },
                        child: Text(
                          "Already have an account? Log in",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
