import 'package:flutter/material.dart';
import 'package:prescriptions/views/Paitentprofile.dart';
import 'package:provider/provider.dart';
import 'package:prescriptions/controllers/Paitentcontroller.dart';
import 'package:prescriptions/models/Paitentmodel.dart';
import 'package:prescriptions/Api/Api.dart';

class Paitentedit extends StatefulWidget {
  @override
  _PaitenteditState createState() => _PaitenteditState();
}

class _PaitenteditState extends State<Paitentedit> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Paitent _currentPaitent;
  @override
   void initState(){
    super.initState();
    Paitentcontroller paitentcontroller=Provider.of<Paitentcontroller>(context,listen:false);

    if (paitentcontroller.currentPaitent!=null) {
      _currentPaitent=paitentcontroller.currentPaitent;
    }
    else{
     _currentPaitent= new Paitent();
    }
   }

   Widget _buildNameField(){
      return TextFormField(
        keyboardType: TextInputType.text,
        initialValue: _currentPaitent.name,
        style: TextStyle(fontSize:20.0),
         decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_box),
                      labelText: "Name",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
        validator: (String value){
          if(value.isEmpty){
            return 'Name is required';
          }
          if(value.length<4||value.length>20){
            return 'Name must be more than 3 and less than 20';
          }
          return null;
        },
        onChanged: (String value){
          _currentPaitent.name=value;
        },
      );
   }

   Widget _buildAgeField(){
      return TextFormField(
        keyboardType: TextInputType.text,
        initialValue: _currentPaitent.age,
        style: TextStyle(fontSize:20.0),
         decoration: InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity),
                      labelText: "Age",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
        validator: (String value){
          if(value.isEmpty){
            return 'Age is required';
          }
          
          return null;
        },
        onChanged: (String value){
          _currentPaitent.age=value;
        },
      );
   }

   Widget _buildHeightField(){
      return TextFormField(
        initialValue: _currentPaitent.height,
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize:20.0),
         decoration: InputDecoration(
                      prefixIcon: Icon(Icons.adjust),
                      labelText: "Height",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
        validator: (String value){
          if(value.isEmpty){
            return 'Height is required';
          }
          return null;
        },
        onChanged: (String value){
          _currentPaitent.height=value;
        },
      );
   }

      Widget _buildPasswordField(){
      return TextFormField(
        initialValue: _currentPaitent.password,
        keyboardType: TextInputType.visiblePassword,
       // obscureText: true,
        style: TextStyle(fontSize:20.0),
         decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
        validator: (String value){
          if(value.isEmpty){
            return 'Password is required';
          }
          if(value.length<6){
            return 'Password should be more than 6';
          }
          return null;
        },
        onChanged: (String value){
          _currentPaitent.password=value;
        },
      );
   }

      Widget _buildconPasswordField(){
      return TextFormField(
        initialValue: _currentPaitent.conPassword,
        keyboardType: TextInputType.visiblePassword,
      //  obscureText: true,
        style: TextStyle(fontSize:20.0),
         decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
        validator: (String value){
          if(value.isEmpty){
            return 'Confirm Password is required';
          }
          if(value.length<6){
            return 'Password should be more than 6';
          }
          return null;
        },
        onChanged: (String value){
          _currentPaitent.conPassword=value;
        },
      );
   }
    
      Widget _buildWeightField(){
      return TextFormField(
        keyboardType: TextInputType.multiline,
        initialValue: _currentPaitent.weight,
        maxLength: 1000,
        style: TextStyle(fontSize:20.0),
         decoration: InputDecoration(
                      prefixIcon: Icon(Icons.beenhere),
                      labelText: "Weight",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
        validator: (String value){
          if(value.isEmpty){
            return 'Weight is required';
          }
          
          return null;
        },
        onChanged: (String value){
          _currentPaitent.weight=value;
        },
      );
   }
   _savePaitent() {
    /*
     final formstate=formkey.currentState;
     if (formstate.validate()) {
       formstate.save();
     */ 
       updatePaitent(_currentPaitent);
       print("name ${_currentPaitent.name}");
    // }
    
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
              new MaterialPageRoute(builder: (context) => Paitentprofile()));
              },
            ),
          ],
        );
      },
    );
   }



  @override
  Widget build(BuildContext context) {
       Paitentcontroller paitentcontroller=Provider.of<Paitentcontroller>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text(paitentcontroller.currentPaitent.name),),
      body: new SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child:new Form(
          key:formkey,
          autovalidate: true,
          child:new Column(children: <Widget>[
           new SizedBox(height: 10.0,),
           new Text("Profile",textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0)),
           new SizedBox(height: 10.0,),
           _buildNameField(),
           new SizedBox(height: 10.0,),
           _buildAgeField(),
            new SizedBox(height: 10.0,),
            _buildHeightField(),
            new SizedBox(height: 10.0,),
            _buildWeightField(),
             new SizedBox(height: 10.0,),
            _buildPasswordField(),
            new SizedBox(height: 10.0,),
            _buildconPasswordField(),           
          ],),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _savePaitent();
           _showDialog();
          },
        child: Icon(Icons.save),
        ),
      
    );
  }
}