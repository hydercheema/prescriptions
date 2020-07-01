import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Doctor{
  String id;
  String name;
  String registration;
  String speciality;
  String password;
  String conPassword;
  String aboutUs;
 // Timestamp createdAt;
  Doctor();
  Doctor.fromMap(Map<String,dynamic> data){
    id=data['id'];
    name=data['name'];
    registration=data['registration'];
    speciality=data['speciality'];
    password=data['password'];
    conPassword=data['conPassword'];
    aboutUs=data['aboutUs'];
  //  createdAt=data['createdAt'];
  }

  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'name':name,
      'registration':registration,
      'speciality': speciality,
      'password': password,
      'conPassword':conPassword,
      'aboutUs': aboutUs

    };
  }

}
