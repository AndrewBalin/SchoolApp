import 'dart:async';
import 'package:flutter/material.dart';
import 'package:schoolapp/Wigets/testCreateCard.dart';
import 'package:schoolapp/Wigets/drawerTeacher.dart';
import 'package:schoolapp/Wigets/questionCreateCard.dart';
import 'package:schoolapp/Wigets/themeCreateCard.dart';

class genWork extends StatefulWidget {
  @override

  genWorkState createState() => genWorkState();
}

class genWorkState extends State<genWork> {
  var question_number = 0;

  List<NewTestCard> ListTest= [
    NewTestCard(question_number: 0, torq: 'theme',)
  ];
  addDynamicTest(torq){
    ListTest.add(NewTestCard(question_number: question_number, torq: torq,));
    setState(() {});
  }
  /*submutData(){
    for(int n = 0; n < ListTest.length; n++){
      ListTest[n].SUBMITER.add(true);
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Создание работы"),
      ),
      drawer: DrawerTeacher(title: "",),
      body: Container(
        child: Column(
          children: [
            Flexible(child: ListView.builder(
                itemCount: ListTest.length,
                itemBuilder: (_, index) => ListTest[index])),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: TextButton(
                  onPressed: () {
                    question_number++;
                    addDynamicTest('t');
                  },
                  child: Text(" + Тестовый вопрос   ", style: TextStyle(fontSize: 15)),
                )),
                Flexible(child: TextButton(
                  onPressed: () {
                    question_number++;
                    addDynamicTest('q');
                  },
                  child: Text(" + Контрольный вопрос", style: TextStyle(fontSize: 15,),
                ))
                ),

              ],),
            RaisedButton(
              color: Color(0xFF6200EE),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                SUBMITER.value = true;
              },
              child: const Text('Сохранить работу', style: TextStyle(color: Colors.white, fontSize: 23),),
            ),
          ],
        ),

      ),

    );
  }
}

class NewTestCard extends StatelessWidget{
  final question_number;
  final torq;
  NewTestCard({Key? key, this.question_number, this.torq}) : super(key: key);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if(torq == "t") {
      return createTestCard(question_number: question_number);
    } else if(torq == "theme"){
      return createThemeCard();
    } else{
      return createQuestionCard(question_number: question_number);
    }
  }
}

