import 'package:flutter/material.dart';
import 'package:prescriptions/Login.dart';
import 'package:firebase_core/firebase_core.dart';

class Doctorsignup extends StatefulWidget {
  @override
  _DoctorsignupState createState() => _DoctorsignupState();
}

class _DoctorsignupState extends State<Doctorsignup> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String name,registration,specialization,conf_password,password;
 
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
                    onSaved: (input) => name = input,
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
                    onSaved: (input) => registration= input,
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
                    onSaved: (input) => specialization = input,
                    keyboardType: TextInputType.number,
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
                        return 'Please enter password';
                      } else if (input.length < 6) {
                        return 'Please enter password more than 6 characters';
                      }
                    },
                    onSaved: (input) => password = input,
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
                    onSaved: (input) => conf_password = input,
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
                        onPressed: (){},
                        child:Text("Create Account",style: TextStyle(color: Colors.white),)
                    ),
                    Spacer(),
                   ]
                  ),
                  new Row(children: <Widget>[
                    Spacer(),
                    new Text("Already Have An Account",style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(
                      margin: const EdgeInsets.only(right: 30),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Login()));
                      },
                      child: Text("Sign in",style: TextStyle(color: Colors.blue, fontSize: 15)
                      ),
                    ),
                    ),
                   ],
                  )
                ])))

    );
  }
}