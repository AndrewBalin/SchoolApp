import 'package:flutter/material.dart';
import 'package:schoolapp/Screens/Teachers/videoCall.dart';
import 'package:schoolapp/Wigets/drawer.dart';
import 'package:schoolapp/Screens/Students/loading_screen.dart';
import 'package:schoolapp/data/Profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/main.dart';

class LessonStart extends StatefulWidget {
  final String title;

  LessonStart({Key? key, required this.title}) : super(key: key);

  @override
  _LessonStartState createState() => _LessonStartState();
}


class _LessonStartState extends State<LessonStart> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _nameCall;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(

        body: ListView(
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Container(
                      width: size.width * 60.0,
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 0.0) ,
                      alignment: Alignment.center,
                      child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Тема урока',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 3, color: Color(0xFF6200EE)),
                                    borderRadius: BorderRadius.circular(15),)),
                              validator: (var value) {
                                if (value == null || value.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Введите тему урока",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                                else {
                                  _nameCall = value;
                                }

                              },
                            ),
                            RaisedButton(
                              color: Color(0xFF6200EE),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VideoCall(name: _nameCall,)));
                                }
                              },
                              child: const Text('Вход', style: TextStyle(color: Colors.white, fontSize: 25),),
                            ),
              ])
          ))
        ])
    );

  }
}