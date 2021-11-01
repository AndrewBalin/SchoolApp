import 'package:flutter/material.dart';
import 'package:schooapp/Wigets/drawer.dart';

class Notifications extends StatefulWidget {
  final String title;

  Notifications({Key? key, required this.title}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Уведомления"),
      ),
      drawer: DrawerStudent(title: 'App',),
    );
  }
}