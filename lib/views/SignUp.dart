/*
import 'package:flutter/material.dart';
import 'package:prescriptions/models/Usermodel.dart';
import 'package:prescriptions/Api/Api.dart';
import 'package:prescriptions/controllers/Usercontroller.dart';
import 'package:provider/provider.dart';
import 'Login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String registeration, password;
  User _user=User();

   @override
   void initState(){
    Usercontroller usercontroller= Provider.of<Usercontroller>(context,listen: false);
    initilizeCurrentUser(usercontroller);
    super.initState();
 
  }

  createAccount(){
   final formState =formkey.currentState;

   if(formState.validate()){
     formState.save();
       Usercontroller usercontroller= Provider.of<Usercontroller>(context,listen: false);
         signUP(_user,usercontroller);
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
              new MaterialPageRoute(builder: (context) => Login()));
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
                        return 'Please enter your email';
                      }
                    },
                    onChanged: (input) => _user.email= input,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
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
                  /*
                  SizedBox(height: 30 ,),
                 new Container(
                   margin: const EdgeInsets.only(left: 30,right: 30),
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'Please enter your registration number';
                      }
                    },
                    onChanged: (input) => _user.= input,
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
                  */
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
                 
                  SizedBox(height: 10,),
                  new Row (children: <Widget>[
                    Spacer(),
                    new RaisedButton(
                        color: Colors.blue,
                        onPressed: (){
                          createAccount();
                          _showDialog();
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
                      onPressed: (

                      ){
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
*/