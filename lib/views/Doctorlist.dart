import 'package:flutter/material.dart';
import 'package:prescriptions/Api/Api.dart';
import 'package:prescriptions/controllers/Doctorcontroller.dart';
import 'package:prescriptions/views/Doctordetail.dart';
import 'package:prescriptions/views/Doctoredit.dart';
import 'package:provider/provider.dart';

class Doctorlist extends StatefulWidget {
  @override
  _DoctorlistState createState() => _DoctorlistState();
}

class _DoctorlistState extends State<Doctorlist> {
  @override
  void initState(){
    Doctorcontroller doctorcontroller= Provider.of<Doctorcontroller>(context,listen: false);
    getDoctor(doctorcontroller);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Doctorcontroller doctorcontroller=Provider.of<Doctorcontroller>(context);

    return Scaffold(
      body: ListView.separated(
        itemBuilder: (BuildContext context,int index){  
          return ListTile(
            title: Text(doctorcontroller.doctorList[index].name,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            subtitle: Text(doctorcontroller.doctorList[index].speciality),
            onTap: (){
              doctorcontroller.currentDoctor=doctorcontroller.doctorList[index];
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>Doctordetail()));
            },

          );
        },
        itemCount: doctorcontroller.doctorList.length,
        separatorBuilder: (BuildContext context, int index){
          return Divider(color: Colors.blue,);
        },
      ),
      
    );
  }
}