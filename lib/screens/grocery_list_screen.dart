import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palate_pal/main.dart';
import 'package:palate_pal/registration_quiz/finished_registration.dart';
import 'package:palate_pal/screens/chat_screen.dart';
import 'package:palate_pal/screens/components/rounded_button.dart';
import 'package:palate_pal/screens/welcome_screen.dart';
import '../constants.dart';
import 'add_task_screen.dart';
import 'components/task.dart';
import 'components/tasks_list.dart';

final _firestore = FirebaseFirestore.instance;
late final User loggedInUser;

class GroceryListScreen extends StatefulWidget {
  static const String id = 'grocery_list_screen';

  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();

  late String messageText;
  List<Task> tasks = [
    Task(name: "½ cup extra virgin olive oil"),
    Task(name: "3 tbsp salted almonds"),
    Task(name: "¼ cup parmesan cheese"),
    Task(name: "3 medium garlic cloves"),
    Task(name: "1 heaping cup fresh basil leaves"),
    Task(name: "2 boneless, skinless chicken breasts"),
    Task(name: "¼ cup shredded mozzarella cheese"),
    Task(name: "½ cup Italian seasoned breadcrumbs"),
    Task(name: "Salt and pepper to season"),
  ];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: Icon(
                        Icons.local_grocery_store,
                        size: 60.0,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    RoundedButton(
                        color: Colors.green,
                        title: 'Export to Instacart',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Grocery List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Total Number: ' + tasks.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: TasksList(tasks),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.lightGreen,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTasksScreen((newTask) {
                    setState(() {
                      tasks.add(Task(name: newTask));
                    });
                    Navigator.pop(context);
                  })),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
