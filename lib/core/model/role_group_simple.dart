class RoleGroupSimple {
  int id;
  String roleGroupName;
  String roleGroupCode;
  String description;
  int status;

  RoleGroupSimple({
    required this.id,
    required this.roleGroupName,
    required this.roleGroupCode,
    required this.description,
    required this.status,
  });

  factory RoleGroupSimple.fromJson(Map<String, dynamic> json) {
    return RoleGroupSimple(
      id: json['id'],
      roleGroupName: json['RoleGroupName'],
      roleGroupCode: json['RoleGroupCode'],
      description: json['Description'],
      status: json['Status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'RoleGroupName': roleGroupName,
      'RoleGroupCode': roleGroupCode,
      'Description': description,
      'Status': status,
    };
  }
}
