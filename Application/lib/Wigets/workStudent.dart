import 'package:flutter/material.dart';

class workStudentCard extends StatelessWidget {
  const workStudentCard({required this.testName,
    required this.testSubject,
    required this.testDescription,
    required this.testUrl,
    required this.size});

  final String testName, testSubject, testDescription, testUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.98,
      height: size.height * 0.15,
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
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
            child: Text("$testName", style: TextStyle(fontSize: 18),),
          ),
          Align(
            alignment: Alignment.topLeft + Alignment(.2, .5),
            child: Text("$testSubject", style: TextStyle(fontSize: 13, color: Colors.blue),),
          ),
          Align(
            alignment: Alignment.topLeft + Alignment(.2, .8),
            child: Text("$testDescription", style: TextStyle(fontSize: 12, color: Colors.grey),),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: OutlineButton(
                color: Colors.blue,
                child: const Text("Пройти тест", style: TextStyle(color: Colors.blue,),),
                onPressed: () {
                })),
        ],
      ),
    );
  }
}