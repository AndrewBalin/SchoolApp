import 'package:flutter/material.dart';
import 'package:schoolapp/Wigets/drawer.dart';
import 'package:schoolapp/Wigets/workStudent.dart';
import 'package:schoolapp/Screens/Students/test_demo.dart';

class WorksPage extends StatefulWidget {
  final String title;

  WorksPage({Key? key, required this.title}) : super(key: key);

  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои Работы"),
      ),
      drawer: DrawerStudent(title: 'App',),
      body: ListView(
        children: <Widget>[
          workStudentCard(
            size: size,
            testDescription: "Решение задач",
            testName: "Системы счисления",
            testSubject: "Информатика",
            testUrl: "",
        ),
          workStudentCard(
            size: size,
            testDescription: "Решение задач",
            testName: "Квадратный корень",
            testSubject: "Математика",
            testUrl: "",
        ),
          workStudentCard(
            size: size,
            testDescription: "Синтаксический разбор",
            testName: "Предложение",
            testSubject: "Русский язык",
            testUrl: "",
        ),
      ]

      ),
    );
  }
}

