import 'package:flutter/material.dart';

class notificationStudentCard extends StatelessWidget {
  const notificationStudentCard(
    {required this.notificationName,
    required this.notificationTheme,
    required this.notificationAvatar,
    required this.notificationDescription,
    required this.size});

  final String notificationName, notificationTheme, notificationAvatar, notificationDescription;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.08,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: /*Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [*/
      Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft + Alignment(.1, 0),
            child: CircleAvatar(
              backgroundImage: NetworkImage("$notificationAvatar"),
              backgroundColor: Colors.white,
              radius: 20,
            )
          ),
          Align(
            alignment: Alignment.topRight + Alignment(-.05, .5),
            child: Text("$notificationName", style: TextStyle(fontSize: 13, color: Colors.blue),),
          ),
          Align(
            alignment: Alignment.topRight + Alignment(-.05, 2),
            child: Text("$notificationDescription", style: TextStyle(fontSize: 12, color: Colors.grey),),
          ),
          Divider(
            indent: 16,
            endIndent: 16,
          )

        ],
      ),
    );
  }
}