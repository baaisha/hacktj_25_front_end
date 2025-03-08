import 'package:flutter/material.dart';
import 'package:hacktj_25_front_end/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Security Camera",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/homePage': (context) => HomePage(),
      },
    );
  }
}