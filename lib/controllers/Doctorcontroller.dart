import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:prescriptions/models/Doctormodel.dart';

 class Doctorcontroller with ChangeNotifier{

   List<Doctor> _doctorList=[];
   Doctor _currentDoctor;

   UnmodifiableListView<Doctor> get doctorList =>UnmodifiableListView(_doctorList);
   Doctor get currentDoctor=> _currentDoctor;

   set doctorList(List<Doctor> doctorlist){
     _doctorList=doctorlist;
     notifyListeners();
   }

   set currentDoctor(Doctor doctor){
     _currentDoctor=doctor;
     notifyListeners();
   }
 }