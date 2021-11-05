import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class createTestCard extends StatefulWidget {

  createTestCard({Key? key}) : super(key: key);

  @override

  _createTestCardState createState() => _createTestCardState();
}

class _createTestCardState extends State<createTestCard> {
  //final _formKey = GlobalKey<FormState>();
  var x = 0.0;
  var i = 2;

  List<Widget> ListTest= [];

  addDynamicQuestion(){
    ListTest.add(NewTestQuestion(number: i));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.98,
      height: 305.0 + x,
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
      child: /*Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [*/
          Form(

              child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                  TextFormField(validator: (value) {},
                    decoration: InputDecoration(
                        labelText: 'Название вопроса',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                          borderRadius: BorderRadius.circular(15),)
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(15.0)),
                  TextFormField(validator: (value) {},
                        decoration: InputDecoration(
                            labelText: 'Ответ 1',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.red),
                              borderRadius: BorderRadius.circular(15),)
                        )
                        ),

                   ListView.builder(itemCount: ListTest.length, itemBuilder: (_, index) => ListTest[index],
                                  shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),),
                   Padding(padding: EdgeInsets.all(15.0)),
                   TextFormField(validator: (value) {},
                        decoration: InputDecoration(
                            labelText: 'Номера правильных ответов',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.red),
                              borderRadius: BorderRadius.circular(15),),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Color(0xFF6200EE)),
                              borderRadius: BorderRadius.circular(15),)
                        )
                    ),
                   Padding(
                        padding: EdgeInsets.all(15.0),
                        child: TextButton(
                          onPressed: () {
                            if(i < 8) {
                              addDynamicQuestion();
                              x = x + 75.0;
                              i++;
                            }else{
                              Fluttertoast.showToast(
                                msg: "Максимальное число ответов введено!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0

                            );
                            }
                          },
                          child: Text(" + Вариант ответа"),),
                  )
                  ])

                ),
              );



  }

}

class NewTestQuestion extends StatelessWidget{
  final number;

  const NewTestQuestion({Key? key, this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      Padding(padding: EdgeInsets.all(6.0)),
      TextFormField(validator: (value) {},
        decoration: InputDecoration(
            labelText: 'Ответ $number',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.circular(15),)
        )
    ),

    ]);


  }
}