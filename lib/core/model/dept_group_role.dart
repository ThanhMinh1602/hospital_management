class DeptGroupRole {
  int id;
  String deptCode;
  String deptName;

  DeptGroupRole({
    required this.id,
    required this.deptCode,
    required this.deptName,
  });

  factory DeptGroupRole.fromJson(Map<String, dynamic> json) {
    return DeptGroupRole(
      id: json['id'],
      deptCode: json['DeptCode'],
      deptName: json['DeptName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'DeptCode': deptCode,
      'DeptName': deptName,
    };
  }
}
