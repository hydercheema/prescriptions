import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:prescriptions/models/Prescriptionmodel.dart';

 class Prescriptioncontroller with ChangeNotifier{

   List<Prescription> _prescriptionList=[];
   Prescription _currentPrescription;

   UnmodifiableListView<Prescription> get prescriptionList =>UnmodifiableListView(_prescriptionList);
   Prescription get currentPrescription=> _currentPrescription;

   set prescriptionList(List<Prescription> prescriptionlist){
     _prescriptionList=prescriptionlist;
     notifyListeners();
   }

   set currentPrescription(Prescription prescription){
     _currentPrescription=prescription;
     notifyListeners();
   }
 }