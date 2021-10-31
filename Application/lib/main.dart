import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final appTitle = 'Drawer Demo';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    var Name = "Андрей";
    var Surname = "Балин";
    var School = "63";
    var Class = "10";
    var ClassLit = "Б";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
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
                      backgroundImage: NetworkImage("https://sun9-2.userapi.com/impg/LFiXijz4xRcA9NB7jSMyT8pwZfBuJbh_iioANQ/lfotjFgYISM.jpg?size=252x244&quality=96&sign=e615a7e3618ace8f3c822379134b17e6&type=album"),
                      radius: 60,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        '$Name $Surname',
                        style: TextStyle(color: Colors.white, fontSize: 18), /*textTheme.headline6,*/
                      ),
                    //),
                  ),
                  Align(
                    alignment: Alignment.centerRight+Alignment(0, .4),
                    child: Text(
                      '$School | $Class"$ClassLit"',
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
              title: Text('Мои работы'),
              selected: _selectedDestination == 0,
              onTap: () => selectDestination(0),
            ),
            ListTile(
              leading: Icon(Icons.notifications_none),
              title: Text('Уведомления'),
              selected: _selectedDestination == 1,
              onTap: () => selectDestination(1),
            ),
            ListTile(
              leading: Icon(Icons.done_all),
              title: Text('Оценки'),
              selected: _selectedDestination == 2,
              onTap: () => selectDestination(2),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('Прогресс'),
              selected: _selectedDestination == 3,
              onTap: () => selectDestination(3),
            ),
            ListTile(
              leading: Icon(Icons.record_voice_over),
              title: Text('Учителя'),
              selected: _selectedDestination == 4,
              onTap: () => selectDestination(4),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Класс'),
              selected: _selectedDestination == 5,
              onTap: () => selectDestination(5),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Сообщения'),
              selected: _selectedDestination == 6,
              onTap: () => selectDestination(6),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Помощь'),
              selected: _selectedDestination == 7,
              onTap: () => selectDestination(7),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('О приложении'),
              selected: _selectedDestination == 8,
              onTap: () => selectDestination(8),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 32.0, 0.0, 0.0),
              child: Text("0.0.2"),
            ),
          ],
        ),
      ),

    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}