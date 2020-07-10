import 'package:flutter/material.dart';
import 'package:prescriptions/controllers/Paitentcontroller.dart';
import 'package:provider/provider.dart';
import 'package:prescriptions/Api/Api.dart';
import 'package:prescriptions/views/Paitentedit.dart';
import 'package:prescriptions/models/User.dart';

class Paitentprofile extends StatefulWidget {
  @override
  _PaitentprofileState createState() => _PaitentprofileState();
}

class _PaitentprofileState extends State<Paitentprofile> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
      body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                 image: AssetImage("asset/appointmentspage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView.separated(
         itemBuilder: (BuildContext context,int index){  
          return Container(
            margin: const EdgeInsets.only(top:90), 
           child: Column(children:<Widget>[  
            new Text(paitentcontroller.paitentList[index].name,style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
            new Row(children:<Widget>[
              Spacer(),
              new IconButton(
              icon: Icon(Icons.edit),
               onPressed: (){
              paitentcontroller.currentPaitent=paitentcontroller.paitentList[index];
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>Paitentedit()));
              },), 
            ]),

           new SizedBox(height:25.0), 
             new Row(children:<Widget>[
              new SizedBox(width:20.0),
               new Text("Age:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:35),
               new Text(paitentcontroller.paitentList[index].age,style: TextStyle(fontSize: 15.0),),                 
               ]
             ),
              
           new SizedBox(height:25.0),
             new Row(children:<Widget>[
              new SizedBox(width:20.0),
               new Text("Height:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:45),
               new Text(paitentcontroller.paitentList[index].height,style: TextStyle(fontSize: 15.0),),                 
               ]
             ),

            /*    
           new SizedBox(height:25.0),
             new Row(children:<Widget>[
              new SizedBox(width:20.0),
               new Text("Weight:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:45),
               new Text(paitentcontroller.paitentList[index].weight,style: TextStyle(fontSize: 15.0),),                 
               ]
             ),
           */
            new SizedBox(height: 20,),
             new Row(children:<Widget>[
               new SizedBox(width:20),
               new Text("Password:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:60.5),
               new Text(paitentcontroller.paitentList[index].password,style: TextStyle(fontSize: 15.0),),                 
               ]
             ),
              new SizedBox(height: 20,),
             new Row(children:<Widget>[
               new SizedBox(width:20),
               new Text("Confirm Password:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:40.0),
               new Text(paitentcontroller.paitentList[index].conPassword,style: TextStyle(fontSize: 15.0),),                 
               ]
             ),

            new SizedBox(height: 35.0,),
             new Row(children:<Widget>[
               new SizedBox(width:20),
               new Text("About:",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
               new SizedBox(width:20.0),
               new Expanded(            
                child: Text(""
               //   doctorcontroller.doctorList[index].aboutUs,
                 // overflow: TextOverflow.clip,),),  
                )  )             
               ]
               
             ),
            
             ] 
           ));
        },
        itemCount: paitentcontroller.paitentList.length,
        separatorBuilder: (BuildContext context, int index){
          return Divider(color: Colors.blue,);
        },
       ),
      ),
          );
               
  }
}