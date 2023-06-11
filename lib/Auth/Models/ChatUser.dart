class ChatUser {
  ChatUser({
    required this.address,
    required this.dateofbirth,
    required this.email,
    required this.image,
    required this.insurance,
    required this.name,
    required this.password,
    required this.phone,
    required this.userid,
  });
  late final String address;
  late final String dateofbirth;
  late final String email;
  late final String image;
  late final String insurance;
  late final String name;
  late final String password;
  late final String phone;
  late final String userid;

  ChatUser.fromJson(Map<String, dynamic> json){
    address = json['address'];
    dateofbirth = json['date of birth'];
    email = json['email'];
    image = json['image'];
    insurance = json['insurance'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    data['date of birth'] = dateofbirth;
    data['email'] = email;
    data['image'] = image;
    data['insurance'] = insurance;
    data['name'] = name;
    data['password'] = password;
    data['phone'] = phone;
    data['userid'] = userid;
    return data;
  }
}