import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/Screens/Teachers/WorkCreate/workCreator.dart';

class createQuestionCard extends StatefulWidget {
  final question_number;
  createQuestionCard({Key? key, this.question_number}) : super(key: key);

  @override
  createQuestionCardState createState() => createQuestionCardState(question_number: question_number);
}

class createQuestionCardState extends State<createQuestionCard> {
  //final _formKey = GlobalKey<FormState>();
  final question_number;
  createQuestionCardState({this.question_number});

  var _name;
  var _trueAnswer;

  StreamSubscription? streamSubscription;
  var numCheck;

  @override
  initState() {
    streamSubscription = genWork.model.SUBMITER.listen((newVal) {
      numCheck = newVal!;
      if(numCheck == '$question_number'){
        print(1);
        submitData();
      }

    });

    super.initState();
  }

  final GlobalKey<FormState> _testQuestionTextKey = GlobalKey<FormState>();

  submitData(){
    if (!_testQuestionTextKey.currentState!.validate()) {}
    _testQuestionTextKey.currentState!.save();
    int number = question_number;
    QuestionData? _result = new QuestionData(number, _name, _trueAnswer);
    var json_result = (jsonEncode(_result));
    genWorkState().questions.add(json_result);
  }

    @override
    void dispose() {
      streamSubscription?.cancel();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.98,
        height: 200,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Form(
        key: _testQuestionTextKey,
        child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Text("$question_number", style: TextStyle(color: Color(0xFF6200EE), fontSize: 25)),
                    ),
                    Padding(padding: EdgeInsets.all(10.0),),
                    Flexible(
                        child: TextFormField(
                          validator: (String? value) {
                            if(value!.isEmpty){
                              return "Название вопроса не может быть пустым";
                            }
                          },
                          onSaved: (String? value){
                            _name = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Название вопроса',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.red),
                                borderRadius: BorderRadius.circular(15),)
                          ),
                        ))
                  ]),
              Padding(padding: EdgeInsets.all(20.0)),
              TextFormField(
                  validator: (String? value) {
                    if(value!.isEmpty){
                      return "Введите правильный ответ на вопрос";
                    }
                  },
                  onSaved: (String? value){
                    _trueAnswer = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Правильный ответ',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Color(0xFF6200EE)),
                        borderRadius: BorderRadius.circular(15),)
                  )
              ),
            ])


        ));



  }

}

class QuestionData {

  final int number;
  final String name, trueAnswer;

  const QuestionData(
      this.number,
      this.name,
      this.trueAnswer);

  Map toJson() => {
    'number': number,
    'name': name,
    'truing': trueAnswer
  };
}