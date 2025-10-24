class UserModel{
  final int id;
  final String name;
  final String createAt;
  final String? email;

  UserModel({
    required this.id,
    required this.name,
    required this.createAt,
    this.email,
  });


factory UserModel.fromJson(Map<String,dynamic>jsonData){
  return UserModel(
    id: jsonData['id'],
    name: jsonData['name'],
    createAt: jsonData['createAt'],
    email: jsonData['email'],
  );
}
//Userdata model create done
  Map<String,dynamic> toJson(){
    return{
      'id':id,
      'name':name,
      'createAt':createAt,
      'email':email,
    };
  }
}