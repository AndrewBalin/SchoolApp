import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schoolapp/Screens/Students/home_screen.dart';
import 'package:schoolapp/Screens/Students/notifications.dart';
import 'package:schoolapp/Screens/Students/grades.dart';
import 'package:schoolapp/Screens/Students/registration_screen.dart';
import 'package:schoolapp/Screens/Teachers/WorkCreate/workCreator.dart';
import 'package:schoolapp/Screens/Teachers/lessons.dart';
import 'package:schoolapp/Screens/Teachers/teacherScreen.dart';
import 'package:schoolapp/data/Profile.dart';


int _selectedDestination = 0;

class DrawerTeacher extends StatefulWidget {
  final String title;

  DrawerTeacher({Key? key, required this.title}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerTeacher> {

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            //padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Color(0xFF6200EE),
            ),
            /*image: DecorationImage(
                      fit: BoxFit.fill,
                      image:  AssetImage('path/to/header_background.png'))),*/
            child: Stack(
                children: <Widget>[
                  /*Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                     padding: const EdgeInsets.all(16.0),
                    ),
                  ),*/
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      //backgroundImage: NetworkImage("https://sun9-2.userapi.com/impg/LFiXijz4xRcA9NB7jSMyT8pwZfBuJbh_iioANQ/lfotjFgYISM.jpg?size=252x244&quality=96&sign=e615a7e3618ace8f3c822379134b17e6&type=album"),
                      radius: 60,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight+Alignment(0, -.4),
                    child: Text(
                      '$n',
                      style: TextStyle(color: Colors.white, fontSize: 18), /*textTheme.headline6,*/
                    ),
                    //),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '$f',
                      style: TextStyle(color: Colors.white, fontSize: 18), /*textTheme.headline6,*/
                    ),
                    //),
                  ),
                  Align(
                    alignment: Alignment.centerRight+Alignment(0, .4),
                    child: Text(
                      '$id',
                      style: TextStyle(color: Colors.white, fontSize: 14), /*textTheme.headline6,*/
                    ),
                  )
                ]
            ),

          ),

          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Работы'),
              selected: _selectedDestination == 0,
              onTap: () {
                selectDestination(0);
                Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherPage(title: '')));
              }
          ),
          ListTile(
              leading: Icon(Icons.notifications_none),
              title: Text('Уведомления'),
              selected: _selectedDestination == 1,
              onTap: () {
                selectDestination(1);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications(title: "")));
              }
          ),
          ListTile(
              leading: Icon(Icons.done_all),
              title: Text('Оценки'),
              selected: _selectedDestination == 2,
              onTap: () {
                selectDestination(2);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Grades(title: "")));
              }
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Классы'),
            selected: _selectedDestination == 5,
            onTap: () {
              selectDestination(5);
              Fluttertoast.showToast(
                  msg: "В РАЗРАБОТКЕ!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Сообщения'),
            selected: _selectedDestination == 6,
            onTap: () {
              selectDestination(6);
              Fluttertoast.showToast(
                  msg: "В РАЗРАБОТКЕ!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
          ListTile(
            leading: Icon(Icons.devices),
            title: Text('Уроки'),
            selected: _selectedDestination == 7,
            onTap: () {
              selectDestination(7);
              Navigator.push(context, MaterialPageRoute(builder: (context) => LessonStart(title: "")));
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Помощь'),
            selected: _selectedDestination == 8,
            onTap: () {
              selectDestination(8);
              Fluttertoast.showToast(
                  msg: "В РАЗРАБОТКЕ!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('О приложении'),
            selected: _selectedDestination == 9,
            onTap: () {
              selectDestination(9);
              Fluttertoast.showToast(
                  msg: "В РАЗРАБОТКЕ!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 32.0, 0.0, 0.0),
            child: Text("Alpha 0.0.12", style: TextStyle(color: Color(0xFF6200EE), fontSize: 20),),
          ),
          ListTile(

            title: Text('Выход', style: TextStyle(color: Colors.red),),

            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn(title: '')));
            },
          ),
        ],
      ),
    );

  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }

}