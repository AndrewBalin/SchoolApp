import 'package:flutter/material.dart';
import 'package:schooapp/Wigets/drawer.dart';
import 'package:schooapp/Screens/Students/loading_screen.dart';
import 'package:schooapp/data/Profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schooapp/main.dart';

bool registr = false;
bool log = false;
var name, surname, classNum, classLit, school, password;

class LogIn extends StatefulWidget {
  final String title;

  LogIn({Key? key, required this.title}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    if(log == true) {
      Fluttertoast.showToast(
          msg: "Проверьте правильность ввода данных и подключение к сети!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0

      );
      log = false;
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Вход в приложение"),
      ),
      drawer: DrawerStudent(title: 'App',),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              width: size.width * 60.0,
              height: size.height,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 0.0) ,
              alignment: Alignment.topCenter,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                TextFormField(
                decoration: const InputDecoration(
                hintText: 'Имя',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите своё имя';
                }
                  else {
                    name = value;
                  }

              },
            ),
                TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Фамилия',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите свою фамилию';
                  }
                  else {
                    surname = value;
                  }

                },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Школа',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите свою школу';
                    }
                    else {
                      school = value;
                    }

                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Класс (нап. 11А)',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите свой класс';
                    }
                    else {
                      classNum = value;
                    }

                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Класс (нап. 11А)',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите свой класс';
                    }
                    else {
                      classLit = value;
                    }

                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Пароль',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Пароль не верный';
                    }
                    else {
                      password = value;
                    }

                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoadingScreen(title: "")));
                      }
                    },
                  child: const Text('Вход'),
                ),
          ]

      ),
    ),
          )
    ]
    )
    );
  }
}