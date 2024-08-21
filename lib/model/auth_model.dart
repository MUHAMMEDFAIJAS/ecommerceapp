class AuthModel {
  String? userid;
  String? email;
  String? username;

  AuthModel({
    this.userid,
    this.email,
    this.username,
  });

  AuthModel.fromjson(Map<String, dynamic> json) {
    userid = json['id'];
    email = json['email'];
    username = json['username'];
  }
  Map<String, dynamic> tojson() {
    return {
      'id': userid,
      'email': email,
      'username': username,
    };
  }
}
