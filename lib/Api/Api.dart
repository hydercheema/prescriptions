import 'package:prescriptions/controllers/Doctorcontroller.dart';
import 'package:prescriptions/models/Doctormodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

getDoctor(Doctorcontroller doctorcontroller) async{
  QuerySnapshot snapshot= await Firestore.instance.collection('Doctor').getDocuments();
  List <Doctor> _doctorlist=[];

  snapshot.documents.forEach((document) {
    Doctor doctor= Doctor.fromMap(document.data);
    _doctorlist.add(doctor);
   });
   doctorcontroller.doctorList=_doctorlist;
}

updateDoctor(Doctor doctor)async{
   CollectionReference doctorRef= Firestore.instance.collection('Doctor'); 
     await doctorRef.document(doctor.id).updateData(doctor.toMap());
     print("updated doctor with id:${doctor.id}");
  
   /*
     else{
       DocumentReference documentReference =await doctorRef.add(doctor.toMap());
       doctor.id= documentReference.documentID;
       print("uploaded successfully: ${doctor.toString()}");
       await documentReference.setData(doctor.toMap(),merge: true); 

     }
    */   
}