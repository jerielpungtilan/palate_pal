import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';
import '../constants.dart';
import 'question_2.dart';
import 'question_4.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;
bool dairyFree = false;
bool glutenFree = false;
bool lowCarb = false;
bool peanutFree = false;

class Question3 extends StatefulWidget {
  static const String id = 'question3';

  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
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
                          'Dietary Restrictions',
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
                      title: Text('Dairy Free'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: dairyFree,
                        onChanged: (value) {
                          setState(() {
                            dairyFree = !dairyFree;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Gluten Free'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: glutenFree,
                        onChanged: (value) {
                          setState(() {
                            glutenFree = !glutenFree;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Low Carb'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: lowCarb,
                        onChanged: (value) {
                          setState(() {
                            lowCarb = !lowCarb;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Peanut Free'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: peanutFree,
                        onChanged: (value) {
                          setState(() {
                            peanutFree = !peanutFree;
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
                          Navigator.pushNamed(context, Question4.id);
                        }),
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Continue',
                        onPressed: () {
                          Navigator.pushNamed(context, Question4.id);
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
