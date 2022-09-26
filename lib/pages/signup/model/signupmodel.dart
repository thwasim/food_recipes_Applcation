class Usermodel {
  String uid;
  String? email;
  String? fullname;
  String? password;
  String? profileimage;

  Usermodel(
      {this.uid = '',
      this.email,
      this.fullname,
      this.password,
      this.profileimage});

  // receiving  data from server
  factory Usermodel.fromMap(map) {
    return Usermodel(
      uid: map['uid'],
      email: map['email'],
      fullname: map['full name'],
      password: map['password'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'full name': fullname,
      'password': password,
    };
  }
}
