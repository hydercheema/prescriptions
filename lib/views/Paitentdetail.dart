import 'package:flutter/material.dart';
import 'package:prescriptions/controllers/Paitentcontroller.dart';
import 'package:provider/provider.dart';
import 'package:prescriptions/Api/Api.dart';

class Paitentdetail extends StatefulWidget {
  @override
  _PaitentdetailState createState() => _PaitentdetailState();
}

class _PaitentdetailState extends State<Paitentdetail> {
   
  @override
  Widget build(BuildContext context) {
    Paitentcontroller doctorcontroller=Provider.of<Paitentcontroller>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text(doctorcontroller.currentPaitent.name),),

      body: Center(
        child:new Container(
          child: new Column(children:<Widget>[
            Text(doctorcontroller.currentPaitent.name,style: TextStyle(fontSize:30.0),),
            SizedBox(height: 10,),
            Text(doctorcontroller.currentPaitent.age,style: TextStyle(fontSize:15,fontStyle:FontStyle.italic),),
            SizedBox(height: 20,),
            Text("About Paitent",style: TextStyle(fontSize: 20.0),),

             SizedBox(height: 10,),   
            new Container(
              margin: const EdgeInsets.only(left:15.0,right: 15.0),
            child:  Expanded(            
                child: Text(""
                  //doctorcontroller.currentPaitent.aboutUs,
                //  overflow: TextOverflow.clip,
                ),
            ), 
         ),                                   
       ]))
      ),
    );
  }
}