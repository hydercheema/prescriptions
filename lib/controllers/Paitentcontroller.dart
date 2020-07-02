import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:prescriptions/models/Paitentmodel.dart';

 class Paitentcontroller with ChangeNotifier{

   List<Paitent> _paitentList=[];
   Paitent _currentPaitent;

   UnmodifiableListView<Paitent> get paitentList =>UnmodifiableListView(_paitentList);
   Paitent get currentPaitent => _currentPaitent;

   set paitentList(List<Paitent> paitentlist){
     _paitentList=paitentlist;
     notifyListeners();
   }

   set currentPaitent(Paitent paitent){
     _currentPaitent=paitent;
     notifyListeners();
   }
 }