class Paitent{
   
  String id;
  String name;
  String height;
  String weight;
  String password;
  String conPassword;
  String age;
 // Timestamp createdAt;
 Paitent({this.id,this.name,this.height,this.weight,this.password,this.conPassword,this.age});

  Paitent.fromMap(Map<String,dynamic> data){
    id=data['id'];
    name=data['name'];
    height=data['height'];
    weight=data['weight'];
    password=data['password'];
    conPassword=data['conPassword'];
    age=data['age'];
  //  createdAt=data['createdAt'];
  }

  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'name':name,
      'height':height,
      'weight': weight,
      'password': password,
      'conPassword':conPassword,
      'age': age

    };
  }

}
