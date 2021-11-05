import 'package:flutter/material.dart';
import 'package:schooapp/Wigets/drawer.dart';
import 'package:schooapp/Wigets/question_create.dart';
import 'package:schooapp/Screens/Students/test_demo.dart';

class TestCreate extends StatefulWidget {
  final String title;

  TestCreate({Key? key, required this.title}) : super(key: key);

  @override
  _TestCreateState createState() => _TestCreateState();
}

class _TestCreateState extends State<TestCreate> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои Работы"),
      ),
      drawer: DrawerStudent(title: 'App',),
      body: ListView(
        children: [
          new createQuestionCard(size: size),
          Row(
            children: [
              TextButton(
                onPressed: () {

                },
                child: Text(" + Тестовый вопрос"),),
              TextButton(
                onPressed: () {},
                child: Text(" + Контрольный вопрос"),),
            ],)
        ],
      )


    );
  }
}
