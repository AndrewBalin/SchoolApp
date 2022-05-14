import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/Screens/Teachers/teacherScreen.dart';
import 'package:schoolapp/Screens/Teachers/WorkCreate/workSave.dart';
import 'package:schoolapp/Wigets/testCreateCard.dart';
import 'package:schoolapp/Wigets/drawerTeacher.dart';
import 'package:schoolapp/Wigets/questionCreateCard.dart';
import 'package:schoolapp/Wigets/themeCreateCard.dart';


List themedata = [];
List ListWidget = [];
List DATAALL = [];
bool load = false;

class genWork extends StatefulWidget {
  static Model model = new Model();
  @override
  genWorkState createState() => genWorkState();
}

class genWorkState extends State<genWork> {
  var question_number = 0;
  List questions = [];
  List<NewTestCard> _ListWidget = [];

  addDynamicTest(torq){
    _ListWidget.add(new NewTestCard(question_number: question_number, torq: torq));
    ListWidget = _ListWidget;
    setState(() {});

  }

  submutData() {
    if(ListWidget.length != 1) {
      count = ListWidget.length;
      setState(() {});
      genWork.model.incrementController('theme');
      Future.delayed(const Duration(milliseconds: 300));
      for (int n = 1; n < ListWidget.length; n++) {
        genWork.model.incrementController('$n');
        Future.delayed(const Duration(milliseconds: 300));
      }
      QuestionsData qd = new QuestionsData(themedata.elementAt(0), ListWidget.length, themedata.elementAt(1), themedata.elementAt(3), themedata.elementAt(2), questions);
      DATAALL.add(jsonEncode(qd));
      print(DATAALL);
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => workSavePage()));

    }
    else{
      Fluttertoast.showToast(
          msg: "Создайте хотя бы один вопрос!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    _ListWidget.add(new NewTestCard(question_number: question_number, torq: 'theme',));
  }

  @override
  void dispose() {
    questions.clear();
    ListWidget.clear();
    super.dispose();
    load = false;
  }

  @override

  Widget build(BuildContext context) {
    if(!load) {
      return Scaffold(
        appBar: AppBar(
            title: Text("Создание работы"),
            actions: [IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => TeacherPage(title: '')));
              },
            )
            ]),
        drawer: DrawerTeacher(title: "",),
        body: Container(
          child: Column(
            children: [
              Flexible(child: ListView.builder(
                  itemCount: _ListWidget.length,
                  itemBuilder: (_, index) => _ListWidget[index])),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: TextButton(
                    onPressed: () {
                      question_number++;
                      addDynamicTest('t');
                    },
                    child: Text(" + Тестовый вопрос   ",
                        style: TextStyle(fontSize: 15)),
                  )),
                  Flexible(child: TextButton(
                      onPressed: () {
                        question_number++;
                        addDynamicTest('q');
                      },
                      child: Text(" + Контрольный вопрос",
                        style: TextStyle(fontSize: 15,),
                      ))
                  ),

                ],),
              RaisedButton(
                color: Color(0xFF6200EE),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  submutData();
                },
                child: const Text('Сохранить работу',
                  style: TextStyle(color: Colors.white, fontSize: 23),),
              ),
            ],
          ),

        ),

      );
    }
    else {
      return Scaffold(
          appBar: AppBar(
            title: Text("Загрузка"),
          ),
          body: Center(
            child: Image.asset("Assets/loading.gif"),

          )
      );
    }
  }

}



class NewTestCard extends StatelessWidget {
  final question_number;
  final torq;

  NewTestCard({Key? key, this.question_number, this.torq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (torq == "t") {
      return new createTestCard(question_number: question_number);
    } else if (torq == 'theme'){
      return new createThemeCard();
    }
    else {
      return new createQuestionCard(question_number: question_number);
    }
  }
}

class Model {
  StreamController _streamController = new StreamController.broadcast();

  Stream get SUBMITER => _streamController.stream;

  void incrementController(SUBMIT) {
    _streamController.add(SUBMIT);
  }
}

class QuestionsData {

  final int count;
  final String name, theme, subject;
  final List itogs, questions;

  const QuestionsData(
      this.name,
      this.count,
      this.theme,
      this.subject,
      this.itogs,
      this.questions,);

  Map toJson() => {
    'name': name,
    'count': count,
    'theme': theme,
    'subject': subject,
    'itogs': itogs,
    'questions': questions
  };
}