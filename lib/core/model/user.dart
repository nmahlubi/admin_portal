class User {
  String email;
  String password;

  User({this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.email != null) {
      data['firstName'] = this.email;
    }
    if (this.password != null) {
      data['lastName'] = this.password;
    }
    return data;
  }
}
