import 'package:flutter/material.dart';
import 'package:schooapp/Wigets/testCard.dart';
import 'package:schooapp/Wigets/drawer.dart';
import 'package:schooapp/Wigets/questionCard.dart';

class genBill extends StatefulWidget {
  @override

  _genBillState createState() => _genBillState();
}

class _genBillState extends State<genBill> {
  List<Widget> ListTest= [];
  addDynamicTest(){
    ListTest.add(NewTestCard());
    setState(() {});
  }
  addDynamicQuestion(){
    ListTest.add(NewQuestionCard());
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Создание работы"),
      ),
      drawer: DrawerStudent(title: "",),
      body: Container(
        child: Column(
          children: [
            Flexible(child: ListView.builder(
                itemCount: ListTest.length,
                itemBuilder: (_, index) => ListTest[index])),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: addDynamicTest,
                  child: Text(" + Тестовый вопрос"),),
                TextButton(
                  onPressed: addDynamicQuestion,
                  child: Text(" + Контрольный вопрос"),),
              ],),
            OutlineButton(
              onPressed: () {},
              child: Text("Сохранить работу"),
            )
          ],
        ),

      ),

    );
  }
}

class NewTestCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return createTestCard();
  }
}
class NewQuestionCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return createQuestionCard(size: size,);
  }
}
