import 'dart:async';
import 'package:prescriptions/controllers/Doctorcontroller.dart';
import 'package:prescriptions/controllers/Usercontroller.dart';
import 'package:prescriptions/models/Descriptionmodel.dart';
import 'package:prescriptions/models/Doctormodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prescriptions/controllers/Paitentcontroller.dart';
import 'package:prescriptions/models/Paitentmodel.dart';
import 'package:prescriptions/models/Prescriptionmodel.dart';
import 'package:prescriptions/models/Usermodel.dart';


loginUser(User user,Usercontroller usercontroller) async{
  AuthResult authResult= await FirebaseAuth.instance.
  signInWithEmailAndPassword(email: user.email, password: user.password).
  catchError((error)=> print(error.code));

  if (authResult!=null) {
    FirebaseUser firebaseUser =authResult.user;

    if (firebaseUser!=null) {
      print("login:$firebaseUser");
      usercontroller.setUser(firebaseUser);
    }
  }
}
signUP(User user, Usercontroller usercontroller)async{
   AuthResult authResult= await FirebaseAuth.instance.
  createUserWithEmailAndPassword(email: user.email, password: user.password).
  catchError((error)=> print(error.code));

  if (authResult!=null) {
     UserUpdateInfo updateInfo=UserUpdateInfo();
    // updateInfo.displayName=user.name;
   //  updateInfo.displayName=user.email;
  //   updateInfo.displayName=user.age;
  //   updateInfo.displayName=user.height;
  //   updateInfo.displayName=user.weight;
    FirebaseUser firebaseUser =authResult.user;

    if (firebaseUser!=null) {
      print("login:$firebaseUser");
      usercontroller.setUser(firebaseUser);
    }
  }
}
signOut(Usercontroller usercontroller)async{
  await FirebaseAuth.instance.signOut().catchError((error)=> print(error.code));
  usercontroller.setUser(null);
}

initilizeCurrentUser(Usercontroller usercontroller) async{
  FirebaseUser firebaseUser= await FirebaseAuth.instance.currentUser();

  if (firebaseUser!=null) {
    usercontroller.setUser(firebaseUser);
  }
}

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
  
   
}

createDoctor(Doctor doctor) async{

     CollectionReference doctorRef= Firestore.instance.collection('Doctor'); 
     DocumentReference documentReference =await doctorRef.add(doctor.toMap());
       doctor.id= documentReference.documentID;
       print("uploaded successfully: ${doctor.toString()}");
       await documentReference.setData(doctor.toMap(),merge: true); 
       print("added successfully");

}

getPaitent(Paitentcontroller paitentcontroller) async{
  QuerySnapshot snapshot= await Firestore.instance.collection('Paitent').getDocuments();
  List <Paitent> _paitentlist=[];

  snapshot.documents.forEach((document) {
    Paitent paitent= Paitent.fromMap(document.data);
    _paitentlist.add(paitent);
   });
    paitentcontroller.paitentList=_paitentlist;
}

updatePaitent(Paitent paitent)async{
   CollectionReference paitentRef= Firestore.instance.collection('Paitent'); 
     await paitentRef.document(paitent.id).updateData(paitent.toMap());
     print("updated doctor with id:${paitent.id}");
  
   
}

createPaitent(Paitent paitent) async{

      CollectionReference doctorRef= Firestore.instance.collection('Paitent'); 
      DocumentReference documentReference =await doctorRef.add(paitent.toMap());
       paitent.id= documentReference.documentID;
       print("uploaded successfully: ${paitent.toString()}");
       await documentReference.setData(paitent.toMap(),merge: true); 
       print("added successfully");

}
createDescription(Description description) async{

     CollectionReference descriptionRef= Firestore.instance.collection('Description'); 
     DocumentReference documentReference =await descriptionRef.add(description.toMap());
       description.id= documentReference.documentID;
       print("uploaded successfully: ${description.toString()}");
       await documentReference.setData(description.toMap(),merge: true); 
       print("added successfully");

}

createPrescription(Prescription prescription) async{

     CollectionReference descriptionRef= Firestore.instance.collection('Prescription'); 
     DocumentReference documentReference =await descriptionRef.add(prescription.toMap());
       prescription.id= documentReference.documentID;
       print("uploaded successfully: ${prescription.toString()}");
       await documentReference.setData(prescription.toMap(),merge: true); 
       print("added successfully");

}
/*
mbbsDoctor(String mbbs) async{
  
 return Firestore.instance.collection('Doctor')
 .where('speciality',isEqualTo: mbbs).snapshots();
}
*/

Future <String> getCurrentID() async{
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
return (await  _firebaseAuth.currentUser()).uid;
  

}

Future add(Doctorcontroller doctorcontroller) async{
  List <Doctor> _doctorlist=[];
 
  Firestore.instance.collection("Doctor").where("speciality", isEqualTo: "MBBS")
  .snapshots()
  .listen((data) =>
    
    data.documents.forEach((document) {
    Doctor doctor= Doctor.fromMap(document.data);
    _doctorlist.add(doctor);
   }));

    doctorcontroller.doctorList=_doctorlist;     
}    

Future got () async{
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  await _firebaseAuth.currentUser();

        

}

final FirebaseAuth _auth = FirebaseAuth.instance;
getCurrentUser(Doctorcontroller doctorcontroller) async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    // Similarly we can get email as well
    final uemail = user.email;
    Firestore.instance.collection('Doctor').document(uid).snapshots();
    print(uid);
    print(uemail);
    //print(uemail);
  }

getLatestPaitent(Doctorcontroller doctorcontroller){
  return Firestore.instance
  .collection('Doctor')
  .where('speciality',isEqualTo: 'MBBS').getDocuments();
}