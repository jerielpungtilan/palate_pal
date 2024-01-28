import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/main.dart';
import 'package:palate_pal/screens/chat_screen.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';
import 'package:palate_pal/screens/exercise_screen.dart';
import 'package:palate_pal/screens/grocery_list_screen.dart';
import 'package:palate_pal/screens/health_information_screen.dart';
import 'package:palate_pal/screens/recipe_screen.dart';
import 'package:palate_pal/screens/welcome_screen.dart';
import '../constants.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    Widget titleBox(String title) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(title,
              style: TextStyle(color: colorScheme.onInverseSurface)),
        ),
      );
    }

    void handleClick(String value) {
      switch (value) {
        case 'Profile':
          break;
        case 'Settings':
          break;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text(
          'PalatePal',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          child: Column(
                            children: [
                              Icon(
                                Icons.restaurant,
                                size: 100.0,
                                color: Colors.white,
                              ),
                              Text(
                                'Recipes',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white70),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, RecipeScreen.id);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              padding: EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 40.0)),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        ElevatedButton(
                          child: Column(
                            children: [
                              Icon(
                                Icons.directions_run,
                                size: 100.0,
                                color: Colors.white,
                              ),
                              Text(
                                'Exercises',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white70,
                                ),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              padding: EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 40.0)),
                          onPressed: () {
                            Navigator.pushNamed(context, ExerciseScreen.id);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_grocery_store,
                            size: 100.0,
                            color: Colors.white,
                          ),
                          Text(
                            'Grocery List',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                            ),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 40.0)),
                      onPressed: () {
                        Navigator.pushNamed(context, GroceryListScreen.id);
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      child: Column(
                        children: [
                          Icon(
                            Icons.medical_information,
                            size: 100.0,
                            color: Colors.white,
                          ),
                          Text(
                            'Health Information',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                            ),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 40.0)),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, HealthInformationScreen.id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: colorScheme.onTertiaryContainer,
        backgroundColor: colorScheme.tertiaryContainer,
        onPressed: () {
          Navigator.pushNamed(context, ChatScreen.id);
        },
        child: const Icon(Icons.chat_bubble_outline),
      ),
    );
  }
}
