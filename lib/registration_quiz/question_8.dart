import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/registration_quiz/finished_registration.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';

import '../constants.dart';
import 'question_6.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;
bool diabetes = false;
bool highBloodPressure = false;
bool liverDisease = false;
bool kidneyDisease = false;
bool anemia = false;
bool pots = false;

class Question8 extends StatefulWidget {
  static const String id = 'question8';

  @override
  _Question8State createState() => _Question8State();
}

class _Question8State extends State<Question8> {
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
                          'PalatePal can demystify your medical records and suggest recipes and fitness plans that cater to your plan of care.',
                          textStyle: TextStyle(
                            fontSize: 40.0,
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
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Upload Medical Records',
                        onPressed: () {
                          Navigator.pushNamed(context, FinishedRegistration.id);
                        }),
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Request Medical Records',
                        onPressed: () {
                          Navigator.pushNamed(context, FinishedRegistration.id);
                        }),
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Skip',
                        onPressed: () {
                          Navigator.pushNamed(context, FinishedRegistration.id);
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
