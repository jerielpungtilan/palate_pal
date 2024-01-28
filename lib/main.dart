import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:palate_pal/registration_quiz/finished_registration.dart';
import 'package:palate_pal/registration_quiz/question_1.dart';
import 'package:palate_pal/registration_quiz/question_2.dart';
import 'package:palate_pal/registration_quiz/start_registration.dart';
import 'package:palate_pal/screens/baked_pesto_chicken_with_mozzarella.dart';
import 'package:palate_pal/screens/bridges_screen.dart';
import 'package:palate_pal/screens/grocery_list_screen.dart';
import 'package:palate_pal/screens/health_information_screen.dart';
import 'package:palate_pal/screens/home_screen.dart';
import 'package:palate_pal/screens/recipe_screen.dart';

import 'firebase_options.dart';
import 'registration_quiz/question_3.dart';
import 'registration_quiz/question_4.dart';
import 'registration_quiz/question_5.dart';
import 'registration_quiz/question_6.dart';
import 'registration_quiz/question_7.dart';
import 'registration_quiz/question_8.dart';
import 'screens/chat_screen.dart';
import 'screens/exercise_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(PalatePal());
}

class PalatePal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        Question1.id: (context) => Question1(),
        Question2.id: (context) => Question2(),
        Question3.id: (context) => Question3(),
        Question4.id: (context) => Question4(),
        Question5.id: (context) => Question5(),
        Question6.id: (context) => Question6(),
        Question7.id: (context) => Question7(),
        Question8.id: (context) => Question8(),
        FinishedRegistration.id: (context) => FinishedRegistration(),
        StartRegistration.id: (context) => StartRegistration(),
        HomeScreen.id: (context) => HomeScreen(),
        RecipeScreen.id: (context) => RecipeScreen(),
        BakedPestoChickenWithMozzarella.id: (context) =>
            BakedPestoChickenWithMozzarella(),
        GroceryListScreen.id: (context) => GroceryListScreen(),
        ExerciseScreen.id: (context) => ExerciseScreen(),
        BridgesScreen.id: (context) => BridgesScreen(),
        HealthInformationScreen.id: (context) => HealthInformationScreen(),
      },
    );
  }
}
