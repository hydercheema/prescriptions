import 'package:flutter/material.dart';

class Paitentprofile extends StatefulWidget {
  @override
  _PaitentprofileState createState() => _PaitentprofileState();
}

class _PaitentprofileState extends State<Paitentprofile> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                 new Container(
                    margin: const EdgeInsets.only(top: 60),
                    child :new Row(children: <Widget>[
                      Spacer(),
                          new ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: InkWell(
                                  onTap: () {
                                    print("2");
                                  },
                                  child: Image.asset("asset/icon1.png",
                                      width: 180.0,
                                      height: 160.0,
                                      fit: BoxFit.fill))),
                                      Spacer()  
                   ],               
                  ),
                ),
              ] 
            )
          )
       )         
    );
  }
}