class Permission {
  final int id;
  final String groupRoleCode;
  final String groupRoleName;
  final List<int> role;

  Permission({
    required this.id,
    required this.groupRoleCode,
    required this.groupRoleName,
    required this.role,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      id: json['id'],
      groupRoleCode: json['GroupRoleCode'],
      groupRoleName: json['GroupRoleName'],
      role: List<int>.from(json['Role']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'GroupRoleCode': groupRoleCode,
      'GroupRoleName': groupRoleName,
      'Role': role,
    };
  }
}
