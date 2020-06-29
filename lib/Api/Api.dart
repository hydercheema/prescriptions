import 'package:prescriptions/controllers/Doctorcontroller.dart';
import 'package:prescriptions/models/Doctormodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prescriptions/views/Doctorlist.dart';

getDoctor(Doctorcontroller doctorcontroller) async{
  QuerySnapshot snapshot= await Firestore.instance.collection('Doctor').getDocuments();
  List <Doctor> _doctorlist=[];

  snapshot.documents.forEach((document) {
    Doctor doctor= Doctor.fromMap(document.data);
    _doctorlist.add(doctor);
   });
   doctorcontroller.doctorList=_doctorlist;
}