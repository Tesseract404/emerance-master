class adminModel {
  adminModel({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
    required this.userid,
  });
  late final String email;
  late final String name;
  late final String password;
  late final String phone;
  late final String userid;

  adminModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    userid = json['userid'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    data['phone'] = phone;
    data['userid'] = userid;
    return data;
  }
}
