import 'package:http/http.dart' as http;
import 'package:schooapp/Screens/Students/registration_screen.dart';

var n, f, c, l, s, id;
var t;


Future<String> reg(name, surname, classNum, classLit, school, password) async{
  n = f = c = l = s = null;
  print("http://a0595760.xsph.ru/?n='$name'&f='$surname'&c=$classNum&l='$classLit'&s='$school'&p='$password'");
  var response = await http.get(Uri.parse(
      "http://a0595760.xsph.ru/?n='$name'&f='$surname'&c=$classNum&l='$classLit'&s='$school'&p='$password'"));

  print(response.body);

  n = name;
  f = surname;
  c = classNum;
  l = classLit;
  s = school;
  if(response.body.toString() != ''){
    registr = true;
    id = response.body.toString();
  }else{
    registr = false;
  }
  return response.body.toString();
}
