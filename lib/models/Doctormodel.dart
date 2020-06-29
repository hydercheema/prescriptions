import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor{
  String id;
  String name;
  String registration;
  String speciality;
  String password;
  String conPassword;
 // Timestamp createdAt;

  Doctor.fromMap(Map<String,dynamic> data){
    id=data['id'];
    name=data['name'];
    registration=data['registration'];
    speciality=data['speciality'];
    password=data['password'];
    conPassword=data['conPassword'];
  //  createdAt=data['createdAt'];
  }

}
