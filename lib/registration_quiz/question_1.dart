import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';
import '../constants.dart';
import 'question_2.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;
bool saveMoney = false;
bool saveTime = false;
bool loseWeight = false;
bool tryNewRecipes = false;
bool manageMyHealthConditions = false;

class Question1 extends StatefulWidget {
  static const String id = 'question1';

  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();

  late String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'What are your goals with PalatePal?',
                          textStyle: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                          speed: const Duration(milliseconds: 50),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: const Duration(milliseconds: 200),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    ListTile(
                      title: Text('Save money'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: saveMoney,
                        onChanged: (value) {
                          setState(() {
                            saveMoney = !saveMoney;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Save time'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: saveTime,
                        onChanged: (value) {
                          setState(() {
                            saveTime = !saveTime;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Lose weight'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: loseWeight,
                        onChanged: (value) {
                          setState(() {
                            loseWeight = !loseWeight;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Try new recipes'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: tryNewRecipes,
                        onChanged: (value) {
                          setState(() {
                            tryNewRecipes = !tryNewRecipes;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Manage my health conditions'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: manageMyHealthConditions,
                        onChanged: (value) {
                          setState(() {
                            manageMyHealthConditions =
                                !manageMyHealthConditions;
                          });
                        },
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {},
                      decoration: textFieldDecoration.copyWith(
                        hintText: 'Other goals',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.lightGreenAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Skip',
                        onPressed: () {
                          Navigator.pushNamed(context, Question2.id);
                        }),
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Continue',
                        onPressed: () {
                          Navigator.pushNamed(context, Question2.id);
                        }),
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Previous',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
