import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

List ListWorks = [];

class workStudentCard extends StatelessWidget {
  const workStudentCard({required this.testName,
    required this.testSubject,
    required this.testTheme,
    /**required this.testId**/});

  final String testName, testSubject, testTheme /**testId**/;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      child:
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
            child: Text("$testTheme", style: TextStyle(fontSize: 12, color: Colors.grey),),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: OutlineButton(
                  color: Colors.blue,
                  child: const Text("Информация", style: TextStyle(color: Colors.blue,),),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "В РАЗРАБОТКЕ!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  })),
        ],
      ),
    );
  }
}