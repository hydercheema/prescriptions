import 'package:flutter/material.dart';
import 'package:prescriptions/Makeappointment.dart';

class Paitenthome extends StatefulWidget {
  @override
  _PaitenthomeState createState() => _PaitenthomeState();
}

class _PaitenthomeState extends State<Paitenthome> {
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
                              borderRadius: BorderRadius.circular(0.0),
                              child: InkWell(
                                  onTap: () {
                                    print("2");
                                  },
                                  child: Image.asset("asset/healthcare-and-medical.png",
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.fill))),
                                      Spacer()  
                   ],               
                  ),
                ), 
                 new Row(
                    children: <Widget>[
                      new Spacer(),
                      new Text(
                        "Select a Doctor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      new Spacer(),
                    ],
                  ),
                 new Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          new ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: InkWell(
                                  onTap: () {
                                     Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Makeappointment()));
                                  },
                                  child: Image.asset("asset/mbbs.png",
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.fill))),
                          new Spacer(),
                          new ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: InkWell(
                                  onTap: () {
                                    print("1");
                                  },
                                  child: Image.asset("asset/dentist.png",
                                      width: 130.0,
                                      height: 140.0,
                                      fit: BoxFit.fill))),
                          new Spacer(),
                        ],
                      )),
                new Container(
                  // margin: const EdgeInsets.only(right: 60),     
                  child:new Row(
                    children: <Widget>[
                      new Spacer(),
                      new Text(
                        "MBBS Doctor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      new Spacer(),
                      new Text(
                        "Dentist Doctor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Spacer()
                    ],
                  ),
                 ),  
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child :new Row(children: <Widget>[
                      Spacer(),
                          new ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: InkWell(
                                  onTap: () {
                                    print("2");
                                  },
                                  child: Image.asset("asset/pharmacist.jpeg",
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.fill))),
                                      Spacer()  
                   ],               
                  ),
                ),
             new Container(  
             //  margin: const EdgeInsets.only(right:100),
                child: Row(
                    children: <Widget>[
                      new Spacer(),
                      new Text(
                        "Pharmacist",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Spacer()
                    ]
                 )
             )  
                     ]))));
  }
}