import 'package:flutter/material.dart';

class createQuestionCard extends StatefulWidget {
  final question_number;
  createQuestionCard({Key? key, this.question_number}) : super(key: key);

  @override

  _createQuestionCardState createState() => _createQuestionCardState(question_number: question_number);
}

class _createQuestionCardState extends State<createQuestionCard> {
  //final _formKey = GlobalKey<FormState>();
  final question_number;
  var x = 0.0;
  var i = 2;
  _createQuestionCardState({this.question_number});

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
        child:  ListView(
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
                        child: TextFormField(validator: (value) {},
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
              Padding(padding: EdgeInsets.all(15.0)),
              TextFormField(validator: (value) {},
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


    );



  }

}