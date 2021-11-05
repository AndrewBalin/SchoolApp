import 'package:flutter/material.dart';
import 'package:schooapp/Wigets/question_create.dart';
import 'package:schooapp/Wigets/drawer.dart';

class genBill extends StatefulWidget {
  @override

  _genBillState createState() => _genBillState();
}

class _genBillState extends State<genBill> {
  List<DynamicWidget> ListDynamic= [];
  addDynamic(){
    ListDynamic.add(DynamicWidget());
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      drawer: DrawerStudent(title: "",),
      body: Container(
        child: Column(
          children: [
            Flexible(child: ListView.builder(
                itemCount: ListDynamic.length,
                itemBuilder: (_, index) => ListDynamic[index])),
            Row(
              children: [
                TextButton(
                  onPressed: addDynamic,
                  child: Text(" + Тестовый вопрос"),),
                TextButton(
                  onPressed: () {},
                  child: Text(" + Контрольный вопрос"),),
              ],)
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.business_center),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: createQuestionCard(size: size,),
    );
  }
}
