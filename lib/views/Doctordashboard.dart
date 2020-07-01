import 'package:flutter/material.dart';
import 'package:prescriptions/views/Doctorappointments.dart';
import 'package:prescriptions/controllers/Doctorcontroller.dart';
import 'package:provider/provider.dart';
import 'package:prescriptions/Api/Api.dart';

import 'Doctorprofile.dart';
class Doctordashboard extends StatefulWidget {
  @override
  _DoctordashboardState createState() => _DoctordashboardState();
}

class _DoctordashboardState extends State<Doctordashboard> {
   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
   String index;
   @override
  void initState(){
    Doctorcontroller doctorcontroller= Provider.of<Doctorcontroller>(context,listen: false);
    getDoctor(doctorcontroller);
    super.initState();
  }

   int _selectedIndex = 0;
 
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _pageOptions=[
   Doctorappointments(),
   Doctorprofile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: _pageOptions[_selectedIndex],
                 bottomNavigationBar: BottomNavigationBar(
                   currentIndex:_selectedIndex,
                      items: const <BottomNavigationBarItem>[                      
                        BottomNavigationBarItem(
                          icon: Icon(Icons.add_to_queue),
                          title: Text('Appointments'),                          
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.account_circle),
                          title: Text('Profile'),
          ),
        ],
               // currentIndex: _selectedIndex,
                selectedItemColor: Colors.blue,
                onTap: _onItemTapped,
      ),

    );
  }
}