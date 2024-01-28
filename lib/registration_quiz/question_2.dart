import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';
import '../constants.dart';
import 'question_2.dart';
import 'question_3.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;
bool vegetarian = false;
bool omnivore = false;
bool pescatarian = false;
bool vegan = false;

class Question2 extends StatefulWidget {
  static const String id = 'question2';

  @override
  _Question2State createState() => _Question2State();
}

class _Question2State extends State<Question2> {
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
                          'What\'s your palate?',
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
                      title: Text('Vegetarian'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: vegetarian,
                        onChanged: (value) {
                          setState(() {
                            vegetarian = !vegetarian;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Omnivore'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: omnivore,
                        onChanged: (value) {
                          setState(() {
                            omnivore = !omnivore;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Pescatarian'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: pescatarian,
                        onChanged: (value) {
                          setState(() {
                            pescatarian = !pescatarian;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Vegan'),
                      trailing: Checkbox(
                        activeColor: Colors.lightGreenAccent,
                        value: vegan,
                        onChanged: (value) {
                          setState(() {
                            vegan = !vegan;
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
                          Navigator.pushNamed(context, Question3.id);
                        }),
                    RoundedButton(
                        color: Colors.lightGreenAccent,
                        title: 'Continue',
                        onPressed: () {
                          Navigator.pushNamed(context, Question3.id);
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
