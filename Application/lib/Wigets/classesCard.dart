import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/Screens/Teachers/WorkCreate/workCreator.dart';

class classesCard extends StatefulWidget {
  classesCard(Key? key) : super(key: key);

  @override
  classesCardState createState() => classesCardState();
}

class classesCardState extends State<classesCard>{

  final GlobalKey<FormState> _testQuestionKey = GlobalKey<FormState>();

  List<Widget> ClassesList = [];

  submitData() {

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 500.0,

        child: Form(
            key: _testQuestionKey,
            child: ListView(
                children: <Widget>[
                  Row(
                      children: [

                      ]),

                ])
        ));
  }

}

class Checkbox extends StatefulWidget {
  final classOne;
  Checkbox(Key? key, this.classOne) : super(key: key);

  TextEditingController controller = new TextEditingController();

  @override
  CheckboxState createState() => CheckboxState(classOne: classOne);

}

class CheckboxState extends State<Checkbox>{
  final classOne;
  CheckboxState ({Key? key, this.classOne});

  bool valueing = false;

  @override
  Widget build(BuildContext context) {
    return
      StatefulBuilder(
        builder: (context, _setState) => CheckboxListTile(
        value: valueing,
        onChanged: (value) {
          setState(() {
            valueing = value!;
          });
        },
        title: Text(classOne),
    ));
  }
    
}
