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

  static List<RoleGroupSimple> roleGroupSimpleDatas = [
    RoleGroupSimple(
        id: 1,
        roleGroupCode: "001",
        roleGroupName: 'Quản trị hệ thống',
        description: 'Nhóm quyền quản trị hệ thống',
        status: 1),
    RoleGroupSimple(
        id: 2,
        roleGroupCode: "002",
        roleGroupName: 'Bác sĩ ngoại trú',
        description: 'Nhóm quyền bác sĩ ngoại trú',
        status: 1),
    RoleGroupSimple(
        id: 3,
        roleGroupCode: "001",
        roleGroupName: 'Quản trị hệ thống',
        description: 'Nhóm quyền quản trị hệ thống',
        status: 1),
    RoleGroupSimple(
        id: 4,
        roleGroupCode: "002",
        roleGroupName: 'Bác sĩ ngoại trú',
        description: 'Nhóm quyền bác sĩ ngoại trú',
        status: 1),
    RoleGroupSimple(
        id: 5,
        roleGroupCode: "001",
        roleGroupName: 'Quản trị hệ thống',
        description: 'Nhóm quyền quản trị hệ thống',
        status: 1),
    RoleGroupSimple(
        id: 6,
        roleGroupCode: "002",
        roleGroupName: 'Bác sĩ ngoại trú',
        description: 'Nhóm quyền bác sĩ ngoại trú',
        status: 1),
    RoleGroupSimple(
        id: 7,
        roleGroupCode: "001",
        roleGroupName: 'Quản trị hệ thống',
        description: 'Nhóm quyền quản trị hệ thống',
        status: 1),
    RoleGroupSimple(
        id: 8,
        roleGroupCode: "002",
        roleGroupName: 'Bác sĩ ngoại trú',
        description: 'Nhóm quyền bác sĩ ngoại trú',
        status: 0),
    RoleGroupSimple(
        id: 9,
        roleGroupCode: "001",
        roleGroupName: 'Quản trị hệ thống',
        description: 'Nhóm quyền quản trị hệ thống',
        status: 1),
    RoleGroupSimple(
        id: 10,
        roleGroupCode: "002",
        roleGroupName: 'Bác sĩ ngoại trú',
        description: 'Nhóm quyền bác sĩ ngoại trú',
        status: 1),
    RoleGroupSimple(
        id: 11,
        roleGroupCode: "001",
        roleGroupName: 'Quản trị hệ thống',
        description: 'Nhóm quyền quản trị hệ thống',
        status: 0),
    RoleGroupSimple(
        id: 12,
        roleGroupCode: "002",
        roleGroupName: 'Bác sĩ ngoại trú',
        description: 'Nhóm quyền bác sĩ ngoại trú',
        status: 0),
    RoleGroupSimple(
        id: 13,
        roleGroupCode: "001",
        roleGroupName: 'Quản trị hệ thống',
        description: 'Nhóm quyền quản trị hệ thống',
        status: 1),
    RoleGroupSimple(
        id: 14,
        roleGroupCode: "002",
        roleGroupName: 'Bác sĩ ngoại trú',
        description: 'Nhóm quyền bác sĩ ngoại trú',
        status: 1),
    RoleGroupSimple(
        id: 15,
        roleGroupCode: "001",
        roleGroupName: 'Quản trị hệ thống',
        description: 'Nhóm quyền quản trị hệ thống',
        status: 0),
  ];
}
