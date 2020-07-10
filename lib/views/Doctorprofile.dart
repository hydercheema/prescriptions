import 'package:flutter/material.dart';
import 'package:prescriptions/views/Doctoredit.dart';
import 'package:provider/provider.dart';
import 'package:prescriptions/controllers/Doctorcontroller.dart';
import 'package:prescriptions/Api/Api.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Doctorprofile extends StatefulWidget {
  @override
  _DoctorprofileState createState() => _DoctorprofileState();
}

class _DoctorprofileState extends State<Doctorprofile> {
  
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
     body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/appointmentspage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          child:  ListView.separated(
         itemBuilder: (BuildContext context,int index){  
          return Container(
            margin: const EdgeInsets.only(top:90), 
           child: Column(children:<Widget>[  
             new RaisedButton(
               onPressed: (){}
               ),
            new Text(doctorcontroller.doctorList[index].name,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
            new Row(children:<Widget>[
              Spacer(),
              new IconButton(
              icon: Icon(Icons.edit),
               onPressed: (){
              doctorcontroller.currentDoctor=doctorcontroller.doctorList[index];
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>Doctoredit()));
              },), 
            ]),

           new SizedBox(height:25.0), 
             new Row(children:<Widget>[
              new SizedBox(width:20.0),
               new Text("Specialization:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:35),
               new Text(doctorcontroller.doctorList[index].speciality,style: TextStyle(fontSize: 15.0),),                 
               ]
             ),
              
           new SizedBox(height:25.0),
             new Row(children:<Widget>[
              new SizedBox(width:20.0),
               new Text("Regitration#:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:45),
               new Text(doctorcontroller.doctorList[index].registration,style: TextStyle(fontSize: 15.0),),                 
               ]
             ),
            new SizedBox(height: 20,),
             new Row(children:<Widget>[
               new SizedBox(width:20),
               new Text("Password:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:60.5),
               new Text(doctorcontroller.doctorList[index].password,style: TextStyle(fontSize: 15.0),),                 
               ]
             ),
              new SizedBox(height: 20,),
             new Row(children:<Widget>[
               new SizedBox(width:20),
               new Text("Confirm Password:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:40.0),
               new Text(doctorcontroller.doctorList[index].conPassword,style: TextStyle(fontSize: 15.0),),                 
               ]
             ),

            new SizedBox(height: 35.0,),
             new Row(children:<Widget>[
               new SizedBox(width:20),
               new Text("About:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:20.0),
               new Expanded(            
                child: Text(
                  doctorcontroller.doctorList[index].aboutUs,
                  overflow: TextOverflow.clip,),),                 
               ]
             ),
            
             ] 
           ));
        },
        itemCount: doctorcontroller.doctorList.length,
        separatorBuilder: (BuildContext context, int index){
          return Divider(color: Colors.blue,);
          
        },
       ),
       
      ),
    );
  }
}