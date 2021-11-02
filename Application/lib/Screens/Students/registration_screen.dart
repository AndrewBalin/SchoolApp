import 'package:flutter/material.dart';
import 'package:schooapp/Wigets/drawer.dart';
import 'package:schooapp/Wigets/notification.dart';

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
                return null;
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
                  return null;
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
                    return null;
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
                    return null;
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
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                    }
                  },
                  child: const Text('Submit'),
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