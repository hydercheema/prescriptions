import 'package:flutter/material.dart';
import 'package:prescriptions/views/Paitentappointments.dart';
import 'package:prescriptions/views/Paitenthome.dart';
import 'package:prescriptions/views/Paitentprofile.dart';
class Paitentdashboard extends StatefulWidget {
  @override
  _PaitentdashboardState createState() => _PaitentdashboardState();
}

class _PaitentdashboardState extends State<Paitentdashboard> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
   
   int _selectedIndex = 0;
 
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _pageOptions=[
   Paitenthome(),
   Paitentappointments(),
   Paitentprofile()
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
                          icon: Icon(Icons.home),
                          title: Text('Home'),
                        ),
                      
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
