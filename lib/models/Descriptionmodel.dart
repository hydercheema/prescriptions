class Description{
   
  String id;
  String description;
  // Timestamp createdAt;
 Description({this.id,this.description});

  Description.fromMap(Map<String,dynamic> data){
    id=data['id'];
    description=data['description'];
  //  createdAt=data['createdAt'];
  }

  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'description':description,
      
    };
  }

}
