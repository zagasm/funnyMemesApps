import 'package:flutter/material.dart';
import 'package:zagasm/screen/auth/SplashScreen.dart';
import 'package:zagasm/screen/profile/userProfile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zagasm',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  Splashscreen(),
    );
  }
}
