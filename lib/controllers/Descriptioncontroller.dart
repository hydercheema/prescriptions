import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:prescriptions/models/Descriptionmodel.dart';

 class Descriptioncontroller with ChangeNotifier{

   List<Description> _descriptionList=[];
   Description _currentDescription;

   UnmodifiableListView<Description> get descriptionList =>UnmodifiableListView(_descriptionList);
   Description get currentdescription=> _currentDescription;

   set descriptionList(List<Description> descriptionlist){
     _descriptionList=descriptionlist;
     notifyListeners();
   }

   set currentDescription(Description description){
     _currentDescription=description;
     notifyListeners();
   }
 }