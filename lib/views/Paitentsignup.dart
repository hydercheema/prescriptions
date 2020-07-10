
import 'package:flutter/material.dart';
import 'package:prescriptions/controllers/Usercontroller.dart';
import 'package:prescriptions/models/Paitentmodel.dart';
import 'package:prescriptions/models/Usermodel.dart';
import 'package:prescriptions/views/Login.dart';
import 'package:provider/provider.dart';
import 'package:prescriptions/controllers/Paitentcontroller.dart';
import 'package:prescriptions/Api/Api.dart';

class Paitentsignup extends StatefulWidget {
  @override
  _PaitentsignupState createState() => _PaitentsignupState();
}

class _PaitentsignupState extends State<Paitentsignup> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
   Paitent _currentPaitent;
   User _user;
  String name,age,height,weight,conf_password,password;
   @override
   void initState(){
    Usercontroller usercontroller= Provider.of<Usercontroller>(context,listen: false);
    initilizeCurrentUser(usercontroller);
    super.initState();
 
  }

   /*
   @override
   void initState(){
    super.initState();
    Paitentcontroller paitentcontroller=Provider.of<Paitentcontroller>(context,listen:false);

    if (paitentcontroller.currentPaitent!=null) {
      _currentPaitent=paitentcontroller.currentPaitent;
    }
    else{
     _currentPaitent=  Paitent();
    }
   }
  */
  createAccount(){
   final formState =formkey.currentState;

   if(formState.validate()){
     formState.save();
       Usercontroller usercontroller= Provider.of<Usercontroller>(context,listen: false);
         signUP(_user,usercontroller);
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
                  //  onChanged: (input) => _user.name = input,
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
                  new Container(
                    margin: const EdgeInsets.only(top: 30,left: 30,right: 30),
                  child:TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter your email';
                      }
                    },
                    onChanged: (input) => _user.email = input,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: "Email",
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
                        return 'Please enter your Age';
                      }
                    },
                 //   onChanged: (input) => _user.age = input,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.accessibility),
                      labelText: "Age",
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
                        return 'Please enter your Height';
                      }
                    },
                   // onChanged: (input) => _user.height = input,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.wc),
                      labelText: "Height",
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
                        return 'Please enter your Weight';
                      }
                    },
                    onChanged: (input) => _currentPaitent.weight = input,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.ac_unit),
                      labelText: "weight",
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
                    onChanged: (input) => _user.password = input,
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
                  /*
                  SizedBox(height: 30,),
                 new Container(
                      margin: const EdgeInsets.only(left: 30,right: 30),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return ' Please confirm password';
                      }
                    },
                    onChanged: (input) => _currentPaitent.conPassword = input,
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
                 */
                  SizedBox(height: 10,),
                  new Row (children: <Widget>[
                    Spacer(),
                    new RaisedButton(
                        color: Colors.blue,
                        onPressed: (){
                         //  createPaitent(_currentPaitent);
                           createAccount();
                        },
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
