class RoleGroup {
  final int id;
  final String roleCode;
  final String roleName;
  final String description;
  final int status;

  RoleGroup({
    required this.id,
    required this.roleCode,
    required this.roleName,
    required this.description,
    required this.status,
  });

  factory RoleGroup.fromJson(Map<String, dynamic> json) {
    return RoleGroup(
      id: json['id'],
      roleCode: json['RoleCode'],
      roleName: json['RoleName'],
      description: json['Description'],
      status: json['Status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'RoleCode': roleCode,
      'RoleName': roleName,
      'Description': description,
      'Status': status,
    };
  }
}
