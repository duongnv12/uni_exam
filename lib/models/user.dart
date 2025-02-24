class User {
  final String id;
  final String userCode;
  final String email;
  final String password;
  final String fullName;
  final String roleId;

  User({
    required this.id,
    required this.userCode,
    required this.email,
    required this.password,
    required this.fullName,
    required this.roleId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userCode: json['userCode'],
      email: json['email'],
      password: json['password'],
      fullName: json['fullName'],
      roleId: json['roleId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userCode': userCode,
      'email': email,
      'password': password,
      'fullName': fullName,
      'roleId': roleId,
    };
  }
}