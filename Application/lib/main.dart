import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schooapp/Wigets/drawer.dart';
import 'package:schooapp/Screens/Students/home_screen.dart';

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
      home: WorksPage(title: "Мои работы"),
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
      ),
    );
  }
}