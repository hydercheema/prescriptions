import 'package:flutter/material.dart';

class Paitentappointments extends StatefulWidget {
  @override
  _PaitentappointmentsState createState() => _PaitentappointmentsState();
}

class _PaitentappointmentsState extends State<Paitentappointments> {
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
       )
    );
  }
}