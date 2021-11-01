import 'package:flutter/material.dart';
import 'package:schooapp/Wigets/drawer.dart';

class Grades extends StatefulWidget {
  final String title;

  Grades({Key? key, required this.title}) : super(key: key);

  @override
  _GradesState createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Оценки"),
      ),
      drawer: DrawerStudent(title: 'App',),
    );
  }
}