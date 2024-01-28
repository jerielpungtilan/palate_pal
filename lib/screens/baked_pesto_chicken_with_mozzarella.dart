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

class BakedPestoChickenWithMozzarella extends StatefulWidget {
  static const String id = 'baked_pesto_chicken_with_mozzarella';

  @override
  _BakedPestoChickenWithMozzarellaState createState() =>
      _BakedPestoChickenWithMozzarellaState();
}

class _BakedPestoChickenWithMozzarellaState
    extends State<BakedPestoChickenWithMozzarella> {
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
          'Baked Pesto Chicken With Mozzarella',
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
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                                'images/baked_pesto_chicken_with_mozzarella.jpg')),
                        SizedBox(
                          height: 40.0,
                        ),
                        RoundedButton(
                            color: Colors.lightGreenAccent,
                            title: 'Add to Grocery List',
                            onPressed: () {}),
                        // Ingredients
                        Text(
                          "Ingredients",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text("- 2 boneless, skinless chicken breasts"),
                        Text("- ¼ cup shredded mozzarella cheese"),
                        Text("- ¼-½ cup Italian seasoned breadcrumbs"),
                        Text("- Salt and pepper to season"),

                        // Pesto Directions
                        SizedBox(height: 20.0),
                        Text(
                          "To make the pesto:",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text("- ½ cup extra virgin olive oil"),
                        Text("- 3 tbsp salted almonds"),
                        Text("- ¼ cup parmesan cheese"),
                        Text("- 3 medium garlic cloves"),
                        Text("- 1 heaping cup fresh basil leaves"),
                        Text("- Opt. pinch of salt"),

                        // Recipe Directions
                        SizedBox(height: 20.0),
                        Text(
                          "Directions",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text("- Preheat the oven to 375 degrees."),
                        SizedBox(height: 10.0),
                        Text(
                          "Make the pesto. If using a pre-made pesto, you can skip this series of steps.",
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Add the fresh basil leaves, garlic cloves, parmesan cheese, salted almonds, extra virgin olive oil to a food processor or nutri bullet blender.",
                        ),
                        Text(
                          "Mix well. You may need to stop a few times to scrape down the sides of the blender canister. Continue mixing until all ingredients are well-incorporated.",
                        ),
                        Text(
                          "Taste. If you prefer more salt or are on a high-salt diet for POTS, you can add more salt to your liking. Usually, I add a pinch more salt.",
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Slice chicken breasts in half completely. Cover slices with plastic wrap. With a meat mallet or rolling pin, pound the chicken slices to an even thickness (about ¼-½ inch thick).",
                        ),
                        Text(
                            "Salt and pepper each side of each chicken slice."),
                        Text(
                          "Spread pesto over one side of each chicken slice. Roll slices up and secure each pesto stuffed chicken breast with a toothpick.",
                        ),
                        Text(
                          "Drizzle extra virgin olive oil over the tops of each rolled-up chicken breast.",
                        ),
                        Text(
                          "Sprinkle breadcrumbs over the tops of the chicken with a spoon. A healthy coating of breadcrumbs should cover each piece of chicken.",
                        ),
                        Text("Bake at 375 degrees for 15 minutes."),
                        Text(
                          "Remove chicken from the oven and sprinkle shredded mozzarella over each baked pesto chicken roll.",
                        ),
                        Text(
                          "Bake for another 5 minutes or until chicken is cooked through and mozzarella is melted and bubbly.",
                        ),
                        Text(
                            "Let cool for 2-3 minutes. Serve, eat, and enjoy!"),
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
