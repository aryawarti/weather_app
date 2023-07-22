import 'package:flutter/material.dart';
import 'package:mausam_app/Activity/Home.dart';
import 'package:mausam_app/Activity/Loading.dart';
import 'package:mausam_app/Activity/Loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:  Home(), 'no need to declar this because route will do it also'.
      routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
       '/loading':(context)=>Loading(),
    }
    );
  }
}
