import 'package:flutter/material.dart';
import 'package:schooapp/Wigets/drawer.dart';
import 'package:schooapp/Wigets/notification.dart';

class Notifications extends StatefulWidget {
  final String title;

  Notifications({Key? key, required this.title}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Уведомления"),
      ),
      drawer: DrawerStudent(title: 'App',),
      body: ListView(
          children: <Widget>[
            notificationStudentCard(
              notificationAvatar: "https://cdn2.iconfinder.com/data/icons/picons-essentials/71/new-512.png",
              notificationDescription: "Русский язык | Предложение",
              notificationName: "Выставлен новый тест",
              notificationTheme: "",
              size: size,
            ),
            notificationStudentCard(
              notificationAvatar: "https://vvelske.ru/media/posts/1/bus-number-4-velsk.jpg",
              notificationDescription: "Математика | Степенная функция",
              notificationName: "Вам выставлена оценка 4",
              notificationTheme: "",
              size: size,
            ),
          ]

      ),
    );
  }
}