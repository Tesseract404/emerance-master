class Message {
  Message({
    required this.formid,
    required this.msg,
    required this.read,
    required this.told,
    required this.sent,
  });
  late final String formid;
  late final String msg;
  late final String read;
  late final String told;
  late final String sent;

  Message.fromJson(Map<String, dynamic> json){
    formid = json['formid'];
    msg = json['msg'];
    read = json['read'];
    told = json['told'];
    sent = json['sent'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['formid'] = formid;
    data['msg'] = msg;
    data['read'] = read;
    data['told'] = told;
    data['sent'] = sent;
    return data;
  }
}