import 'package:prescriptions/views/Makeappointment.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:prescriptions/controllers/Doctorcontroller.dart';

class Doctordetail extends StatefulWidget {
  @override
  _DoctordetailState createState() => _DoctordetailState();
}

class _DoctordetailState extends State<Doctordetail> {
  @override
  Widget build(BuildContext context) {
    Doctorcontroller doctorcontroller=Provider.of<Doctorcontroller>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text(doctorcontroller.currentDoctor.name),),

      body: Center(
        child:new Container(
          child: new Column(children:<Widget>[
             new Row(children:<Widget>[
              Spacer(),
              new IconButton(
              icon: Icon(Icons.feedback),
               onPressed: (){
            //  doctorcontroller.currentDoctor=doctorcontroller.doctorList[index];
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>Makeappointment()));
              },
              ), 
            ]),

            Text(doctorcontroller.currentDoctor.name,style: TextStyle(fontSize:30.0),),
            SizedBox(height: 10,),
            Text(doctorcontroller.currentDoctor.speciality,style: TextStyle(fontSize:15,fontStyle:FontStyle.italic),),
            SizedBox(height: 20,),
            Text("About Doctor",style: TextStyle(fontSize: 20.0),),

             SizedBox(height: 10,),   
            new Container(
              margin: const EdgeInsets.only(left:15.0,right: 15.0),
            child:  Expanded(            
                child: Text(
                  doctorcontroller.currentDoctor.aboutUs,
                  overflow: TextOverflow.clip,
                ),
            ),
             
         ),                                   
       ]))
      ),
    );
  }
}