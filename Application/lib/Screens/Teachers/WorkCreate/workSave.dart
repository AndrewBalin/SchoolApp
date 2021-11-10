import 'package:flutter/material.dart';
import 'package:schoolapp/data/Profile.dart';

int count = 0;

class workSavePage extends StatefulWidget {

  workSavePage({Key? key}) : super(key: key);

  @override

  _workSavePageState createState() => _workSavePageState();
}

class _workSavePageState extends State<workSavePage> {

  //List classes = ProfileClasses;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Настройки работы')),
        body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              TextFormField(validator: (value) {},
                decoration: InputDecoration(
                    labelText: 'Отправить классам',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.red),
                      borderRadius: BorderRadius.circular(15),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),)
                ),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              TextFormField(validator: (value) {},
                  decoration: InputDecoration(
                      labelText: '',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),)
                  )
              ),
              Padding(padding: EdgeInsets.all(8.0)),

              Padding(padding: EdgeInsets.all(8.0)),
              TextFormField(validator: (value) {},
                  decoration: InputDecoration(
                      labelText: 'Правильных ответов на оценки 3, 4, 5',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),)
                  )
              ),
            ])
    );

  }
}




