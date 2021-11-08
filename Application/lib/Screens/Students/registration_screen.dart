import 'package:flutter/material.dart';
import 'package:schoolapp/Wigets/drawer.dart';
import 'package:schoolapp/Screens/Students/loading_screen.dart';
import 'package:schoolapp/data/Profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/main.dart';

bool registr = false;
bool log = false;
var name, surname, patronymic, school, password;

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
    var val;
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

      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              width: size.width * 60.0,
              //height: size.height,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 0.0) ,
              alignment: Alignment.center,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                Text("Вход в\n приложение", style: TextStyle(color: Color(0xFF6200EE), fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.all(10.0)),
                TextFormField(
                decoration: InputDecoration(
                    labelText: 'Фамилия Имя Отчество',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Color(0xFF6200EE)),
                      borderRadius: BorderRadius.circular(15),)),
                validator: (var value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите свои ФИО';
                  }
                  else {
                    try {
                      value = value.toString().trim();
                      val = value.split(' ');
                      name = val[1].toString();
                      surname = val[0].toString();
                      patronymic = val[2].toString();
                    } catch (e) {
                      return 'Введиде фамилию, имя и отчество через пробел';
                    }
                  }
                  print(name);
                  print(surname);

                },
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Школа',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Color(0xFF6200EE)),
                        borderRadius: BorderRadius.circular(15),)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите свою школу';
                    }
                    else {
                      school = value.toString();

                    }
                    print(school);

                  },
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Пароль',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Color(0xFF6200EE)),
                        borderRadius: BorderRadius.circular(15),)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Пароль не верный';
                    }
                    else {
                      password = value;
                      print(password);
                    }

                  },
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: CheckboxListTile(
                      title: Text("Я учитель"),
                      value: teacher,
                      onChanged: (newValue) {
                        setState(() {
                          teacher = newValue!;
                        });
                      },
                    )),
                Padding(padding: EdgeInsets.all(5.0)),
                RaisedButton(
                  color: Color(0xFF6200EE),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoadingScreen(title: "")));
                      }
                    },
                  child: const Text('Вход', style: TextStyle(color: Colors.white, fontSize: 25),),
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      OutlineButton(
                        onPressed: () {  },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        highlightElevation: 0,
                        borderSide: BorderSide(color: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                            children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              Image(image: AssetImage("Assets/github.png"), height: 35.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("GitHub", style: TextStyle(
                                            fontSize: 20, color: Colors.grey,)))


                    ]
                  )
                ])
              )
            )

          ]

      ),
    ),

    ])
    )
    ),

    ]));

  }
}