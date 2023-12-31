import 'package:flutter/material.dart';
import 'package:sparky_app/pages/login.dart';
import 'package:sparky_app/pages/signup.dart';
import 'package:sparky_app/pages/home.dart';
import 'package:sparky_app/pages/profile.dart';
import 'package:sparky_app/pages/matches.dart';
import 'package:sparky_app/pages/chat.dart';
import 'package:sparky_app/pages/editProfile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Login(),
        '/signup': (context) => Signup(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
        '/matches': (context) => Matches(),
        '/chat': (context) => Chat(),
        '/editProfile': (context) => EditProfile(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/profile') {
          final email = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => Profile(),
            settings: RouteSettings(arguments: email),
          );
        }
        return null;
      },
    );
  }
}
