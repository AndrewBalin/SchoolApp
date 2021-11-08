import 'package:flutter/material.dart';

class createThemeCard extends StatefulWidget {

  createThemeCard({Key? key}) : super(key: key);

  @override

  _createThemeCardState createState() => _createThemeCardState();
}

class _createThemeCardState extends State<createThemeCard> {
  //final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {

    @override

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('Настройки работы')),
        body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              TextFormField(validator: (value) {},
                decoration: InputDecoration(
                    labelText: 'Название работы',
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
                      labelText: 'Тема работы',
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


