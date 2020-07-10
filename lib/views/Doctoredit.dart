import 'package:flutter/material.dart';
import 'package:prescriptions/controllers/Doctorcontroller.dart';
import 'package:prescriptions/models/Doctormodel.dart';
import 'package:prescriptions/views/Doctorprofile.dart';
import 'package:provider/provider.dart';
import 'package:prescriptions/Api/Api.dart';
class Doctoredit extends StatefulWidget {

  @override
  _DoctoreditState createState() => _DoctoreditState();
}

class _DoctoreditState extends State<Doctoredit> { 
   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
   Doctor _currentDoctor;
   
   @override
   void initState(){
    super.initState();
    Doctorcontroller doctorcontroller=Provider.of<Doctorcontroller>(context,listen:false);

    if (doctorcontroller.currentDoctor!=null) {
      _currentDoctor=doctorcontroller.currentDoctor;
    }
    else{
     _currentDoctor= new Doctor();
    }
   }
   Widget _buildNameField(){
      return TextFormField(
        keyboardType: TextInputType.text,
        initialValue: _currentDoctor.name,
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
          _currentDoctor.name=value;
        },
      );
   }

   Widget _buildRegistrationField(){
      return TextFormField(
        keyboardType: TextInputType.text,
        initialValue: _currentDoctor.registration,
        style: TextStyle(fontSize:20.0),
         decoration: InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity),
                      labelText: "Registeration#",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
        validator: (String value){
          if(value.isEmpty){
            return 'Registration number is required';
          }
          if(value.length<6||value.length>20){
            return 'Registration# must be more than 6 and less than 20';
          }
          return null;
        },
        onChanged: (String value){
          _currentDoctor.registration=value;
        },
      );
   }

   Widget _buildSpecialityField(){
      return TextFormField(
        initialValue: _currentDoctor.speciality,
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize:20.0),
         decoration: InputDecoration(
                      prefixIcon: Icon(Icons.adjust),
                      labelText: "Speciality",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
        validator: (String value){
          if(value.isEmpty){
            return 'Speciality is required';
          }
          return null;
        },
        onChanged: (String value){
          _currentDoctor.speciality=value;
        },
      );
   }

      Widget _buildPasswordField(){
      return TextFormField(
        initialValue: _currentDoctor.password,
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
          _currentDoctor.password=value;
        },
      );
   }

      Widget _buildconPasswordField(){
      return TextFormField(
        initialValue: _currentDoctor.conPassword,
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
          _currentDoctor.conPassword=value;
        },
      );
   }
    
      Widget _buildaboutUsField(){
      return TextFormField(
        keyboardType: TextInputType.multiline,
        initialValue: _currentDoctor.aboutUs,
        maxLength: 1000,
        style: TextStyle(fontSize:20.0),
         decoration: InputDecoration(
                      prefixIcon: Icon(Icons.beenhere),
                      labelText: "About Us",
                      labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
        validator: (String value){
          if(value.isEmpty){
            return 'About us required';
          }
          if(value.length<15){
            return 'About us should be more than 15';
          }
          return null;
        },
        onChanged: (String value){
          _currentDoctor.aboutUs=value;
        },
      );
   }
   _saveDoctor() {
    /*
     final formstate=formkey.currentState;
     if (formstate.validate()) {
       formstate.save();
     */ 
       updateDoctor(_currentDoctor);
       print("name ${_currentDoctor.name}");
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
             //  Navigator.of(context).pop();
              Navigator.of(context).push(
             new MaterialPageRoute(builder: (context) => Doctorprofile()));
              },
            ),
          ],
        );
      },
    );
   }


  @override
  Widget build(BuildContext context) {
    Doctorcontroller doctorcontroller=Provider.of<Doctorcontroller>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text(doctorcontroller.currentDoctor.name),),
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
           _buildRegistrationField(),
            new SizedBox(height: 10.0,),
            _buildSpecialityField(),
            new SizedBox(height: 10.0,),
            _buildaboutUsField(),
             new SizedBox(height: 10.0,),
            _buildPasswordField(),
            new SizedBox(height: 10.0,),
            _buildconPasswordField(),           
          ],),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _saveDoctor();
          _showDialog();
          },
        child: Icon(Icons.save),
        ),
      );
  }
}