import 'package:http/http.dart' as http;
import 'package:schoolapp/Screens/Students/registration_screen.dart';

var n, f, c, l, s, id;
var t;
var teacher = false;
var ProfileClasses;


Future<String> reg(name, surname, patronymic, school, password) async{
  n = f = c = l = s = null;
  print("http://a0595760.xsph.ru/?n='$name'&f='$surname'&o='$patronymic'&s='$school'&p='$password'&t='$teacher'");
  var response = await http.get(Uri.parse(
      "http://a0595760.xsph.ru/?n='$name'&f='$surname'&o='$patronymic'&s='$school'&p='$password'&t='$teacher'"));

  print(response.body);

  n = name;
  f = surname;
  s = school;
  if(response.body.toString() != ''){
    registr = true;
    id = response.body.toString();
  }else{
    registr = false;
  }

  if(teacher){
    var resp = await http.get(Uri.parse(
        "http://a0595760.xsph.ru/?n='$name'&f='$surname'&o='$patronymic'&s='$school'&p='$password'&t='$teacher'"));
    
  }

  return response.body.toString();
}
