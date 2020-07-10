import 'package:flutter/material.dart';
import 'package:prescriptions/Api/Api.dart';
import 'package:prescriptions/models/Doctormodel.dart';
import 'package:prescriptions/controllers/Doctorcontroller.dart';
import 'package:provider/provider.dart';

class Doctorsetprofile extends StatefulWidget {
  @override
  _DoctorsetprofileState createState() => _DoctorsetprofileState();
}

class _DoctorsetprofileState extends State<Doctorsetprofile> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
   Doctor _currentDoctor;
   String name,registration,specialization,conf_password,password,about;

   @override
   void initState(){
    super.initState();
    Doctorcontroller doctorcontroller=Provider.of<Doctorcontroller>(context,listen:false);

    if (doctorcontroller.currentDoctor!=null) {
      _currentDoctor=doctorcontroller.currentDoctor;
    }
    else{
     _currentDoctor=  Doctor();
    }
   }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: new Form(
                key: formkey,
                child: ListView(children: <Widget>[
                  SizedBox(height: 70),
                 new Container(
                    margin: const EdgeInsets.only(top: 100,left: 30,right: 30),
                  child:TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter your Name';
                      }
                    },
                    onChanged: (input) => _currentDoctor.name= input,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: "Name",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                    ),
                   ),
                  ),
                  SizedBox(height: 30 ,),
                 new Container(
                   margin: const EdgeInsets.only(left: 30,right: 30),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter your registration number';
                      }
                    },
                    onChanged: (input) => _currentDoctor.registration= input,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.accessibility),
                      labelText: "Registration#",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                    ),
                  ),
                 ),
                  SizedBox(height: 30 ,),
                  new Container(
                    margin: const EdgeInsets.only(left: 30,right: 30),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter your Specialization';
                      }
                    },
                    onChanged: (input) => _currentDoctor.speciality = input,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.adjust),
                      labelText: "Speciality",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                    ),
                   ),
                  ),

                  SizedBox(height: 30 ,),
                  new Container(
                    margin: const EdgeInsets.only(left: 30,right: 30),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter about youself';
                      }
                      if(input.length<15){
                        return 'About us should be more than 15';
                      } 
                    },
                    onChanged: (input) => _currentDoctor.aboutUs = input,
                    keyboardType: TextInputType.multiline,
                     maxLength: 1000,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.adjust),
                      labelText: "About",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                    ),
                   ),
                  ),

                  SizedBox(height: 30 ,),
                  
                  new Container(
                      margin: const EdgeInsets.only(left: 30,right: 30),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter password';
                      } else if (input.length < 6) {
                        return 'Please enter password more than 6 characters';
                      }
                    },
                    onChanged: (input) => _currentDoctor.password = input,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                    ),
                   ),
                  ),
                  SizedBox(height: 30,),
                 new Container(
                      margin: const EdgeInsets.only(left: 30,right: 30),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return ' Please confirm password';
                      }
                    },
                    onChanged: (input) => _currentDoctor.conPassword = input,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5.0),
                      ),
                    ),
                   ),
                 ),
                  SizedBox(height: 10,),
                  new Row (children: <Widget>[
                    Spacer(),
                    new RaisedButton(
                        color: Colors.blue,
                        onPressed: (){
                          createDoctor(_currentDoctor);
                        },
                        child:Text("Save",style: TextStyle(color: Colors.white),)
                    ),
                    Spacer(),
                   ]
                  ),
                  
                ])))

    );
  }
}