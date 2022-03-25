import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolapp/Wigets/drawer.dart';
import 'package:schoolapp/Screens/Students/home_screen.dart';
import 'package:schoolapp/Screens/Students/registration_screen.dart';
import 'package:schoolapp/Screens/Teachers/onlineLesson.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: LogIn(title: "",),
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
      ),
    );
  }
}