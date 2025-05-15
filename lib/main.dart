import 'package:fireauth/firebase_options.dart';
import 'package:fireauth/pages/home_page.dart';
import 'package:fireauth/pages/login.dart';
import 'package:fireauth/pages/registration.dart';
import 'package:fireauth/pages/second_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fireauth/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login',
      navigatorKey: navigatorKey,
      routes: {
        'login': (context) => const LoginScreen(),
        'register': (context) => const RegisterScreen(),
        'home': (context) => const HomePage(),
        'second': (context) => const SecondPage()
      },
    );
  }
}