class Prescription{
   
  String id;
  String prescription;
  
 Prescription({this.id,this.prescription});

  Prescription.fromMap(Map<String,dynamic> data){
    id=data['id'];
    prescription=data['prescription'];
  }

  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'prescription':prescription,
      
    };
  }

}
