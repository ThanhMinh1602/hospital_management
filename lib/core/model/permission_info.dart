class PermissionInfo {
  int id;
  String groupRoleCode;
  String groupRoleName;
  List<int> role;

  PermissionInfo({
    required this.id,
    required this.groupRoleCode,
    required this.groupRoleName,
    required this.role,
  });

  factory PermissionInfo.fromJson(Map<String, dynamic> json) {
    return PermissionInfo(
      id: json['id'],
      groupRoleCode: json['GroupRoleCode'],
      groupRoleName: json['GroupRoleName'],
      role: List<int>.from(json['Role'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'GroupRoleCode': groupRoleCode,
      'GroupRoleName': groupRoleName,
      'Role': List<dynamic>.from(role.map((x) => x)),
    };
  }
}
