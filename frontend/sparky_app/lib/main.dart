import 'package:flutter/material.dart';
import 'package:sparky_app/pages/login.dart';
import 'package:sparky_app/pages/signup.dart';
import 'package:sparky_app/pages/home.dart';
import 'package:sparky_app/pages/profile.dart';
import 'package:sparky_app/pages/matches.dart';
import 'package:sparky_app/pages/chat.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => Login(),
    '/signup': (context) => Signup(),
    '/home':(context) => Home(),
    '/profile':(context) => Profile(),
    '/matches':(context) => Matches(),
    '/chat':(context) => Chat(),
  },
  ));