import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schoolapp/Screens/Teachers/WorkCreate/workCreator.dart';

class createThemeCard extends StatefulWidget {

  createThemeCard({Key? key}) : super(key: key);

  @override

  _createThemeCardState createState() => _createThemeCardState();
}

class _createThemeCardState extends State<createThemeCard> {
  //final _formKey = GlobalKey<FormState>();
  var SUBMITER = false;

  var dropdownvalue = 'Алгебра';
  var items =  ['Алгебра','Геометрия','Русский язык','Литература','История','Обществознание'];

  var _themeName;
  var _themeTheme;
  var _itogs;

  final GlobalKey<FormState> _testThemeKey = GlobalKey<FormState>();

  StreamSubscription? streamSubscriptionTheme;
  var NumCheck;

  @override

  initState() {
    streamSubscriptionTheme = genWork.model.SUBMITER.listen((newVal) {
          NumCheck = newVal;
          if (NumCheck == 'theme') {
            submitData();
          }
        });
    super.initState();
  }
    submitData(){
      if (!_testThemeKey.currentState!.validate()) {}
      _testThemeKey.currentState!.save();
      _itogs = _itogs.split(', ');
      themedata.add(_themeName);
      themedata.add(_themeTheme);
      themedata.add(_itogs);
      themedata.add(dropdownvalue);
    }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.98,
        height: 315,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Form(
        key: _testThemeKey,
        child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              TextFormField(
                  validator: (String? value) {
                    if(value!.isEmpty){
                      return "Назовите работу";
                    }
                  },
                  onSaved: (String? value){
                    _themeName = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Название работы',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),)
                  ),
                ),
              Padding(padding: EdgeInsets.all(8.0)),
              TextFormField(
                  validator: (String? value) {
                    if(value!.isEmpty){
                      return "Напишите тему работы";
                    }
                  },
                  onSaved: (String? value){
                    _themeTheme = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Тема работы',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),)
                  )
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
              ),

              child: Center(
              child: DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down),
                items:items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items));
                    }
                      ).toList(),
                      onChanged: (String? newValue){
                      setState(() {
                      dropdownvalue = newValue!;
                      });
                  },
              ))),
              Padding(padding: EdgeInsets.all(8.0)),
              TextFormField(
                  validator: (String? value) {
                    if(value!.isEmpty){
                      return "Напишите количество правильных ответов";
                    }
                  },
                  onSaved: (String? value){
                    _itogs = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Правильных ответов на оценки 3, 4, 5',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.red),
                        borderRadius: BorderRadius.circular(15),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.blue),
                        borderRadius: BorderRadius.circular(15),)
                  )
              ),
            ])


    ));



  }

}


