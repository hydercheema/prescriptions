import 'package:flutter/material.dart';

class Makeappointment extends StatefulWidget {
  @override
  _MakeappointmentState createState() => _MakeappointmentState();
}

class _MakeappointmentState extends State<Makeappointment> {
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
            child: Row(children: <Widget>[
              

             ],
            ),

    ));
  }
}