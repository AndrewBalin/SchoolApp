import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/Screens/Teachers/WorkCreate/workCreator.dart';

class createTestCard extends StatefulWidget {
  final question_number;
  createTestCard({Key? key, this.question_number}) : super(key: key);

  @override
  createTestCardState createState() => createTestCardState(question_number: question_number);
}

class createTestCardState extends State<createTestCard>{

  final question_number;

  var x = 0.0;
  var i = 2;

  createTestCardState({this.question_number});

  var _questionName;
  var _trueAnswers;
  var _answersCount;
  var _result;

  StreamSubscription? streamSubscriptionTest;
  var numCheck;

  @override
  initState() {
    super.initState();
    streamSubscriptionTest = genWork.model.SUBMITER.listen((newVal) {
      numCheck = newVal;
      if(numCheck == '$question_number'){
        submitData();
      }

    });


  }

  List _answers = [];

  final GlobalKey<FormState> _testQuestionKey = GlobalKey<FormState>();

  List<NewTestQuestion> ListTest= [NewTestQuestion(number: 1)];


  addDynamicQuestion(){
    ListTest.add(NewTestQuestion(number: i));
    setState(() { });
  }

  submitData() {
    if (!_testQuestionKey.currentState!.validate()) {}
    _testQuestionKey.currentState!.save();
    _answersCount = ListTest.length;
    print(_trueAnswers);
    _trueAnswers = _trueAnswers.split(', ');
    for (int n = 0; n < (ListTest.length); n++){
      _answers.add(ListTest[n].controller.text.toString());
    }
    print("$question_number, $_questionName, $_answersCount, $_answers, $_trueAnswers");
    TestData _result = new TestData(question_number, _questionName, _answersCount, _answers, _trueAnswers);
    var json_result = jsonEncode(_result);
    genWorkState().questions.add(json_result);
  }

  @override
  void dispose() {
    streamSubscriptionTest?.cancel();
    super.dispose();
  }

    @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.98,
      height: 315.0 + x,
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
        key: _testQuestionKey,
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
                _questionName = value;
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
        Padding(padding: EdgeInsets.all(15.0)),
        ListView.builder(itemCount: ListTest.length, itemBuilder: (_, index) => ListTest[index],
                        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),),
         Padding(padding: EdgeInsets.all(15.0)),
         TextFormField(
            validator: (String? value) {
              if(value!.isEmpty){
                return "Введите номера правильных ответов";
               }
                },
              onSaved: (String? value){
                _trueAnswers = value;
              },
              decoration: InputDecoration(
                  labelText: "Номера правильных ответов (нап. '1, 3')",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color(0xFF6200EE)),
                    borderRadius: BorderRadius.circular(15),)
              )
          ),
         Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  if(i < 8) {
                    addDynamicQuestion();
                    x = x + 75.0;
                    i++;
                  }else{
                    Fluttertoast.showToast(
                      msg: "Максимальное число ответов введено!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0

                  );
                  }
                },
                child: Text(" + Вариант ответа"),),
        ),

        ])
    ));
  }

}

class NewTestQuestion extends StatelessWidget{
  @override
  final number;
  NewTestQuestion({Key? key, this.number}) : super(key: key);
  TextEditingController controller = new TextEditingController();

  Widget build(BuildContext context) {
    //var ;
    return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Padding(padding: EdgeInsets.all(6.0)),
      TextFormField(
              validator: (String? value) {
                if(value!.isEmpty){
                return "Введите хотя бы один правильный ответ";
                }
              },
              controller: controller,
              decoration: InputDecoration(
                  labelText: 'Ответ $number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(15),)
              )
        ),
        ]);
  }
}

class TestData {

  final int number, count;
  final String name;
  final List answers, truing;

  const TestData(
    this.number,
    this.name,
    this.count,
    this.answers,
    this.truing);

  Map toJson() => {
    'number': number,
    'name': name,
    'count': count,
    'answers': answers,
    'truing': truing
  };
}