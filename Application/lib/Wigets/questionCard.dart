import 'package:flutter/material.dart';

class createQuestionCard extends StatelessWidget {
  const createQuestionCard({required this.size});

  //final String newAnswer, questTrueAnswers, questCheck, questNewInput, questInput, questName;
  final Size size;

  //final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var checkedValue;
    return Column(
        children: [
          Container(
          width: size.width * 0.98,
          height: size.height * 0.30,
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
          child: /*Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [*/
          Stack(
            children: [
              Align(
                  alignment: Alignment.topLeft + Alignment(.2, 0),
                  child: TextFormField(validator: (value) {},
                    decoration: InputDecoration(
                        labelText: 'Вопрос',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                          borderRadius: BorderRadius.circular(15),)
                    ),
                  )
              ),

              Align(
                  alignment: Alignment.center,
                  child:
                  Form(
                    child: Stack(
                      children: [
                        Align(
                            child: TextFormField(validator: (value) {},
                                decoration: InputDecoration(
                                    labelText: 'Правильный ответ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(15),),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.red),
                                      borderRadius: BorderRadius.circular(15),)
                                )
                            )
                        ),
                        /*Align(
                          alignment: Alignment.bottomLeft,
                          child: CheckboxListTile(
                                title: Text("title text"),
                                value: checkedValue,
                                onChanged: (checkedValue) {},
                                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                              )

                          )*/


                      ],
                    ),
                  )
              ),
              /*Align(
            alignment: Alignment.topLeft + Alignment(.2, .8),
            child: Text("$testDescription", style: TextStyle(fontSize: 12, color: Colors.grey),),
          ),*/
            ],
          ),
        ),

        ]
    );

  }

}