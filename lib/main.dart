import 'package:flutter/material.dart';
import 'package:hacktj_25_front_end/components/noti_service.dart';
import 'package:hacktj_25_front_end/pages/home_page.dart';
import 'package:hacktj_25_front_end/pages/login_page.dart';
import 'package:hacktj_25_front_end/pages/stream_page.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  NotiService().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Security Camera",
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/homePage': (context) => HomePage(),
        '/streamPage': (context) => StreamPage(),
      },
    );
  }
}
