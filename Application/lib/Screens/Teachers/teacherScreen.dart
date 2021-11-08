import 'package:flutter/material.dart';
import 'package:schoolapp/Wigets/drawerTeacher.dart';
import 'package:schoolapp/Wigets/workStudent.dart';
import 'package:schoolapp/Screens/Students/test_demo.dart';

class TeacherPage extends StatefulWidget {
  final String title;

  TeacherPage({Key? key, required this.title}) : super(key: key);

  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Контрольные Работы"),
      ),
      drawer: DrawerTeacher(title: 'App',),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add)
      ),
      body: ListView(
          children: <Widget>[
            Text("Учитель")
          ]

      ),
    );
  }
}