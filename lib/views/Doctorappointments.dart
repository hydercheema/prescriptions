import 'package:flutter/material.dart';
import 'package:prescriptions/models/Paitentmodel.dart';
import 'package:prescriptions/controllers/Paitentcontroller.dart';
import 'package:provider/provider.dart';
import 'package:prescriptions/Api/Api.dart';
import 'package:prescriptions/views/Paitentdetail.dart';

class Doctorappointments extends StatefulWidget {
  @override
  _DoctorappointmentsState createState() => _DoctorappointmentsState();
}

class _DoctorappointmentsState extends State<Doctorappointments> {
  @override
  void initState(){
    Paitentcontroller paitentcontroller= Provider.of<Paitentcontroller>(context,listen: false);
    getPaitent(paitentcontroller);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      Paitentcontroller paitentcontroller=Provider.of<Paitentcontroller>(context);
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (BuildContext context,int index){  
          return ListTile(
            title: Text(paitentcontroller.paitentList[index].name,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            subtitle: Text(paitentcontroller.paitentList[index].age),
            onTap: (){
              paitentcontroller.currentPaitent=paitentcontroller.paitentList[index];
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>Paitentdetail()));
            },

          );
        },
        itemCount: paitentcontroller.paitentList.length,
        separatorBuilder: (BuildContext context, int index){
          return Divider(color: Colors.blue,);
        },
      ),
      
      
      );
  }
}