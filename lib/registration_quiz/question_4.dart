import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';
import '../constants.dart';
import 'question_2.dart';
import 'question_5.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;
bool japanese = false;
bool mediterranean = false;
bool classicAmerican = false;
bool mexican = false;

class Question4 extends StatefulWidget {
  static const String id = 'question4';

  @override
  _Question4State createState() => _Question4State();
}

class _Question4State extends State<Question4> {
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
                          'What cuisines do you like?',
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
                      title: Text('Japanese'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: japanese,
                        onChanged: (value) {
                          setState(() {
                            japanese = !japanese;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Mediterranean'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: mediterranean,
                        onChanged: (value) {
                          setState(() {
                            mediterranean = !mediterranean;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Classic American'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: classicAmerican,
                        onChanged: (value) {
                          setState(() {
                            classicAmerican = !classicAmerican;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Mexican'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: mexican,
                        onChanged: (value) {
                          setState(() {
                            mexican = !mexican;
                          });
                        },
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {},
                      decoration: textFieldDecoration.copyWith(
                        hintText: 'Other',
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
                          Navigator.pushNamed(context, Question5.id);
                        }),
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Continue',
                        onPressed: () {
                          Navigator.pushNamed(context, Question5.id);
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
