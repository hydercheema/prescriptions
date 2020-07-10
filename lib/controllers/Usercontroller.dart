
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Usercontroller with ChangeNotifier{
 FirebaseUser _user;

 FirebaseUser get user=> _user;

 void setUser(FirebaseUser user){
   _user=user;
   notifyListeners();
 }
}