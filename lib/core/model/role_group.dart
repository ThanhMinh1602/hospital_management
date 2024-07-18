class RoleGroup {
  int id;
  String roleCode;
  String roleName;
  String description;
  int status;

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
