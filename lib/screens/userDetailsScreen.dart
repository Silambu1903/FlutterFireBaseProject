import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/colors/colors.dart';
import 'package:image_picker/image_picker.dart';

import 'dashboardScreen.dart';

class UserDetails extends StatefulWidget {
  static String id = "/userDetails";

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late String select;
  late File imageFile = File("");
  int _radioSelected = 1;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String profileUrl;
  late String about;
  late String gender;
  late String dob;
  final _firebaseStorage = FirebaseStorage.instance;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        profileUrl = imageFile.toString();
      }
    });
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      imageFile = File(loggedInUser.photoURL.toString());
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primary,
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Personal Data",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _getFromGallery();
                      },
                      child: ClipRect(
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.3,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.2,
                          decoration: BoxDecoration(
                            color: MyColors.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.file(imageFile, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: Text(
                        "About",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.025,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.09,
                      child: TextField(
                        onChanged: (value) {
                          about = value;
                        },
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: MyColors.accent, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.secondary, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Working',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: Text(
                        "Date of Birth",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.025,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.09,
                      child: TextField(
                        onChanged: (value) {
                          dob = value;
                        },
                        textInputAction: TextInputAction.done,
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: MyColors.accent, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.secondary, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: '01/01/2000',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: Text(
                        "Gender",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .height * 0.025,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.4,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.09,
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.accent, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _radioSelected,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = 1;
                                gender = "Male";
                              });
                            },
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.025),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.4,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.09,
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.accent, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _radioSelected,
                            onChanged: (value) {
                              setState(() {
                                _radioSelected = 2;
                                gender = "Female";
                              });
                            },
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.025),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.07,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        color: MyColors.secondary,
                        child: Text("Submit"),
                        textColor: Colors.white,
                        onPressed: () async {
                          try {
                            var snapshot = await _firebaseStorage
                                .ref()
                                .child('images/'+loggedInUser.displayName.toString()+'profilePic')
                                .putFile(imageFile);
                            var downloadUrl =
                            await snapshot.ref.getDownloadURL();

                            await FirebaseFirestore.instance
                                .collection("UserData")
                                .doc(loggedInUser.uid)
                                .set(
                            {
                            "name": loggedInUser.displayName,
                            "profile":downloadUrl,
                            "email": loggedInUser.email,
                            "about": about,
                            "gender": gender,
                            "dob": dob,
                            },
                            );
                            loggedInUser.updatePhotoURL(profileUrl);
                            Navigator.of(context).pushNamed(Dashboard.id);
                          } catch (e) {
                            print(e);
                          }
                        },
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
