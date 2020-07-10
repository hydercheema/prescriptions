import 'package:flutter/material.dart';
import 'package:prescriptions/Api/Api.dart';
import 'package:prescriptions/models/Prescriptionmodel.dart';
import 'package:prescriptions/controllers/Prescriptioncontroller.dart';
import 'package:prescriptions/views/Paitentdetail.dart';
import 'package:provider/provider.dart';
class Paitentprescription extends StatefulWidget {
  @override
  _PaitentprescriptionState createState() => _PaitentprescriptionState();
}

class _PaitentprescriptionState extends State<Paitentprescription> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Prescription _currentPrescription;

     @override
   void initState(){
    super.initState();
    Prescriptioncontroller prescriptioncontroller=Provider.of<Prescriptioncontroller>(context,listen:false);

    if (prescriptioncontroller.currentPrescription!=null) {
      _currentPrescription=prescriptioncontroller.currentPrescription;
    }
    else{
     _currentPrescription=  Prescription();
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
              new MaterialPageRoute(builder: (context) => Paitentdetail()));
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
                      Text("Please enter your Prescription",style: TextStyle(fontSize:20.0),),
                      new Spacer(),
                    ],),
                  ),
                  SizedBox(height:40),
                  new Container(
                   margin: const EdgeInsets.only(left: 30,right: 30),
                 child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter your prescription';
                      }
                    },
                    onChanged: (input) => _currentPrescription.prescription = input,
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
                          createPrescription(_currentPrescription);
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