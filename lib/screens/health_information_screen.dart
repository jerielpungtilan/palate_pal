import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/main.dart';
import 'package:palate_pal/screens/chat_screen.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';
import 'package:palate_pal/screens/welcome_screen.dart';
import '../constants.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;

class HealthInformationScreen extends StatefulWidget {
  static const String id = 'health_information_screen';

  @override
  _HealthInformationScreenState createState() =>
      _HealthInformationScreenState();
}

class _HealthInformationScreenState extends State<HealthInformationScreen> {
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
      backgroundColor: Colors.green.shade900,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text(
          'Health Information',
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
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.height),
                            title: Text('Height'),
                            subtitle: Text('5\'7\"'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.scale),
                            title: Text('Weight'),
                            subtitle: Text('167lb'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.accessibility),
                            title: Text('Body Mass Index'),
                            subtitle: Text('26.3 BMI'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.percent),
                            title: Text('Body Fat Percentage'),
                            subtitle: Text('28.8%'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.fitness_center),
                            title: Text('Lean Body Mass'),
                            subtitle: Text('121.32'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.cake),
                            title: Text('Hemoglobin A1c'),
                            subtitle: Text('4.9% (<5.7%)'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.breakfast_dining),
                            title: Text('Total Cholesterol'),
                            subtitle: Text('120mg/dL (<200mg/dL)'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.set_meal),
                            title: Text('HDL'),
                            subtitle: Text('90mg/dL (>40mg/dL)'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.fastfood),
                            title: Text('Triglycerides'),
                            subtitle: Text('140mg/dL (<150mg/dL)'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: Icon(Icons.lunch_dining),
                            title: Text('LDL'),
                            subtitle: Text('70mg/dL (<100mg/dL)'),
                            onTap: () {},
                            trailing: Icon(Icons.more_vert),
                            iconColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
