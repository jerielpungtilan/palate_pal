import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';
import '../constants.dart';
import 'question_1.dart';
import 'question_2.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;
bool saveMoney = false;
bool saveTime = false;
bool loseWeight = false;
bool tryNewRecipes = false;
bool manageMyHealthConditions = false;

class StartRegistration extends StatefulWidget {
  static const String id = 'start_registration';

  @override
  _StartRegistrationState createState() => _StartRegistrationState();
}

class _StartRegistrationState extends State<StartRegistration> {
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
                          'Managing your health can be overwhelming. '
                          'Meal planning and exercise routines are not one-size fits all. '
                          'Welcome to PalatePal!',
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
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Continue',
                        onPressed: () {
                          Navigator.pushNamed(context, Question1.id);
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
