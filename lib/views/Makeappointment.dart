import 'package:flutter/material.dart';
import 'package:prescriptions/Api/Api.dart';
import 'package:prescriptions/models/Descriptionmodel.dart';
import 'package:prescriptions/models/Prescriptionmodel.dart';
import 'package:prescriptions/controllers/Descriptioncontroller.dart';
import 'package:prescriptions/views/Doctoredit.dart';
import 'package:provider/provider.dart';

class Makeappointment extends StatefulWidget {
  @override
  _MakeappointmentState createState() => _MakeappointmentState();
}

class _MakeappointmentState extends State<Makeappointment> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Description _currentDescription;

   @override
   void initState(){
    super.initState();
    Descriptioncontroller descriptioncontroller=Provider.of<Descriptioncontroller>(context,listen:false);

    if (descriptioncontroller.currentdescription!=null) {
      _currentDescription=descriptioncontroller.currentdescription;
    }
    else{
     _currentDescription=  Description();
    }
   }
   void  _showDialog() async{
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("alert "),
          content: new Text("data added successfully"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
             //   Navigator.of(context).pop();
              Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => Doctoredit()));
              },
            ),
          ],
        );
      },
    );
   }


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
            child: new Form(
                key: formkey,
                child: ListView(children: <Widget>[
                  SizedBox(height: 20,),
                  new Container(
                     margin: const EdgeInsets.only(top: 100),
                    child: Row(children: <Widget>[
                      new Spacer(),
                      Text("Please enter your description",style: TextStyle(fontSize:20.0),),
                      new Spacer(),
                    ],),
                  ),
                  SizedBox(height:40),
                  new Container(
                   margin: const EdgeInsets.only(left: 30,right: 30),
                 child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter your description';
                      }
                    },
                    onChanged: (input) => _currentDescription.description = input,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    maxLength: 1000,
                    decoration: InputDecoration(
                    //  prefixIcon: Icon(Icons.feedback),
                      labelText: "",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                 ),
                 SizedBox(height: 10,),
                  new Row (children: <Widget>[
                    Spacer(),
                    new RaisedButton(
                        color: Colors.blue,
                        onPressed: (){
                          createDescription(_currentDescription);
                          _showDialog();
                        },
                        child:Text("Send",style: TextStyle(color: Colors.white),)
                    ),
                    Spacer(),
                   ]
                  )
                ],
                )
              )
         )   , 
     );
  }
}