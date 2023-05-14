class UserModel{

    final String name;
    final String dob;
    final String email;
    final String address;
    final String phoneNo;
    final String password;


  const UserModel({
    required this.name,
    required this.dob,
    required this.email,
    required this.address,
    required this.phoneNo,
    required this.password,
});

  toJson(){
    return {
      "name" : name,
      "dob" : dob,
      "email" : email,
      "address" : address,
      "phone" : phoneNo,
      "password" : password,
    };
  }
}