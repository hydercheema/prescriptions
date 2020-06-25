import 'package:flutter/material.dart';

class Doctorprofile extends StatefulWidget {
  @override
  _DoctorprofileState createState() => _DoctorprofileState();
}

class _DoctorprofileState extends State<Doctorprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/appointmentspage.jpg"),
                fit: BoxFit.cover,
              ),
            ),

    ));
  }
}