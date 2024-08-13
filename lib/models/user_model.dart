class UserModel {
  String fullName;
  String eMail;
  String password;
  String id;

  UserModel({
    required this.fullName,
    required this.eMail,
    required this.password,
    required this.id,
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        fullName: map['fullName'],
        eMail: map['eMail'],
        password: map['password'],
        id: map['password'],
        );
  }
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'eMail': eMail,
      'password': password,
      'id': id,
    };
  }
}
