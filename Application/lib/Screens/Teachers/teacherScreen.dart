import 'package:flutter/material.dart';
import 'package:schoolapp/Wigets/drawerTeacher.dart';
import 'package:schoolapp/Wigets/workStudent.dart';
import 'package:schoolapp/Screens/Teachers/WorkCreate/workCreator.dart';

List WorkList = [];

class TeacherPage extends StatefulWidget {
  final String title;

  TeacherPage({Key? key, required this.title}) : super(key: key);

  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Контрольные Работы"),
      ),
      drawer: DrawerTeacher(title: 'App',),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => genWork()));
        },
        child: Icon(Icons.add)
      ),
      body: RefreshIndicator(
          color: Color(0xFF6200EE),
          onRefresh: () async {
            //Do whatever you want on refrsh.Usually update the date of the listview
          },
          child:ListView(

          )
      )


    );
  }
}