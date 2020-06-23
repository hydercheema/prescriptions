import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'signUp.dart';
import 'package:hexcolor/hexcolor.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String registeration, password;

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
                  SizedBox(height: 20,),
                  Container(
                      margin: const EdgeInsets.only(top: 100),
                      child: Row(children: <Widget>[
                        Spacer(),
                        new ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: InkWell(
                                onTap: (){print("2");},
                                child: Image.asset("asset/doctor.jpeg",width: 80.0,height: 80.0,fit:BoxFit.fill))),
                        new Spacer(),
                        new ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: InkWell(
                                onTap: (){print("1");},
                                child: Image.asset("asset/paitent.jpeg",width: 80.0,height: 80.0,fit:BoxFit.fill))),
                        new Spacer(),
                      ],
                      )
                  ),
                  new Row(
                    children: <Widget>[
                      new Spacer(),
                      new Text("Doctor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      new Spacer(),
                      new Text("Patient",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      new Spacer()
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),

                  new TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter your Registeration number';
                      }
                    },
                    onSaved: (input) => registeration = input,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity),
                      labelText: "Registeration#",
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
                  SizedBox(height: 30 ,),
                  new TextFormField(
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
                  SizedBox(height: 10,),
                  new Row (children: <Widget>[
                    new Text("No Account"),
                    new FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>signUp()));
                      },
                      child: Text("Sign up",style: TextStyle(color: Colors.blue, fontSize: 15)
                      ),
                    ),
                    Spacer(),
                    new RaisedButton(
                        color: Colors.blue,
                        onPressed: (){},
                        child:Text("Login",style: TextStyle(color: Colors.white),)
                    ),
                  ]
                  ),
                  Divider(
                    color: Colors.black87,
                    height: 30.0,
                  ),
                  new Row(children: <Widget>[
                    new RaisedButton(
                      color:Hexcolor( "#3b5998" ),
                      onPressed: () {
                      },
                      child: Text("Sign In"),
                    ),

                    Spacer(),
                    new SizedBox(
                      //   width:200,
                      //  height: 50,
                      child:RaisedButton(
                        onPressed: () {
                        },
                        child: Text("Sign In"),
                      ),
                    )
                  ],

                  )
                ])))
    );
  }
}
