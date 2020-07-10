import 'package:prescriptions/models/Usermodel.dart';

class User{
 String name;
 String email;
 String password;
 String age;
 String height;
 String weight;
 User();

 Map <String, dynamic>toJson()=>{
  'name':name,
  'email':email,
  'password': password,
  'age':age,
  'height':height,
  'weight':weight
 };
}