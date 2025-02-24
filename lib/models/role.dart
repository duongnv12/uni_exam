class Role {
  final String id;
  final String roleCode;
  final String roleName;

  Role({
    required this.id,
    required this.roleCode,
    required this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      roleCode: json['roleCode'],
      roleName: json['roleName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roleCode': roleCode,
      'roleName': roleName,
    };
  }
}