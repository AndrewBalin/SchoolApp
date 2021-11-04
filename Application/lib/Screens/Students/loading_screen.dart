import 'dart:async';
import 'dart:math';
import 'package:schooapp/data/Profile.dart';
import 'package:flutter/material.dart';
import 'package:schooapp/Screens/Students/home_screen.dart';
import 'package:schooapp/Screens/Students/registration_screen.dart';



class LoadingScreen extends StatefulWidget {
  final String title;

  LoadingScreen({Key? key, required this.title}) : super(key: key);


  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    var temp = reg(name, surname, classNum, classLit, school, password);

    Future.delayed(Duration(seconds: 3), () async {
      if (registr) {
        log = false;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => WorksPage(title: "")));
      } else {
        log = true;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LogIn(title: '',)));
      }
    });



      Size size = MediaQuery.of(context).size;
      return Scaffold(
          appBar: AppBar(
            title: Text("Загрузка"),
          ),
          body: Center(
            child: Image.asset("Assets/loading.gif"),

          )
      );
    }
  }
