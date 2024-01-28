import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/registration_quiz/finished_registration.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';

import '../constants.dart';
import 'question_6.dart';
import 'question_8.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;
bool diabetes = false;
bool highBloodPressure = false;
bool liverDisease = false;
bool kidneyDisease = false;
bool anemia = false;
bool pots = false;

class Question7 extends StatefulWidget {
  static const String id = 'question7';

  @override
  _Question7State createState() => _Question7State();
}

class _Question7State extends State<Question7> {
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
                          'Health Conditions?',
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
                      title: Text('Diabetes'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: diabetes,
                        onChanged: (value) {
                          setState(() {
                            diabetes = !diabetes;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('High Blood Pressure'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: highBloodPressure,
                        onChanged: (value) {
                          setState(() {
                            highBloodPressure = !highBloodPressure;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Liver Disease'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: liverDisease,
                        onChanged: (value) {
                          setState(() {
                            liverDisease = !liverDisease;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Kidney Disease'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: kidneyDisease,
                        onChanged: null,
                      ),
                    ),
                    ListTile(
                      title: Text('Anemia'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: anemia,
                        onChanged: (value) {
                          setState(() {
                            anemia = !anemia;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('POTS'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: pots,
                        onChanged: (value) {
                          setState(() {
                            pots = !pots;
                          });
                        },
                      ),
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {},
                      decoration: textFieldDecoration.copyWith(
                        hintText: 'Other health conditions',
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
                          Navigator.pushNamed(context, Question8.id);
                        }),
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Continue',
                        onPressed: () {
                          Navigator.pushNamed(context, Question8.id);
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
