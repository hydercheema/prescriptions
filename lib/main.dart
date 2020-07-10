import 'package:flutter/material.dart';
import 'package:prescriptions/views/Login.dart';
import 'package:prescriptions/controllers/Doctorcontroller.dart';
import 'package:prescriptions/controllers/Paitentcontroller.dart';
import 'package:prescriptions/controllers/Usercontroller.dart';
import 'package:provider/provider.dart';
import 'controllers/Descriptioncontroller.dart';
import 'controllers/Prescriptioncontroller.dart';
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context)=> Usercontroller(),
    ),
    ChangeNotifierProvider(
      create: (context)=> Doctorcontroller(),
    ),
    ChangeNotifierProvider(
      create: (context)=> Paitentcontroller(),
    ),
     ChangeNotifierProvider(
      create: (context)=> Prescriptioncontroller(),
    ),
     ChangeNotifierProvider(
      create: (context)=> Descriptioncontroller(),
    )
],child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Login(),
    debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(


       );
  }
}
