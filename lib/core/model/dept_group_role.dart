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

  static List<DeptGroupRole> generateFakeData() {
    return [
      DeptGroupRole(id: 1, deptCode: "D001", deptName: "Khoa Nội"),
      DeptGroupRole(id: 2, deptCode: "D002", deptName: "Khoa Ngoại"),
      DeptGroupRole(id: 3, deptCode: "D003", deptName: "Khoa Sản"),
      DeptGroupRole(id: 4, deptCode: "D004", deptName: "Khoa Nhi"),
      DeptGroupRole(id: 5, deptCode: "D005", deptName: "Khoa Cấp cứu"),
      DeptGroupRole(id: 6, deptCode: "D006", deptName: "Khoa Tim mạch"),
      DeptGroupRole(id: 7, deptCode: "D007", deptName: "Khoa Da liễu"),
      DeptGroupRole(id: 8, deptCode: "D008", deptName: "Khoa Răng Hàm Mặt"),
      DeptGroupRole(id: 9, deptCode: "D009", deptName: "Khoa Hô hấp"),
      DeptGroupRole(id: 10, deptCode: "D010", deptName: "Khoa Tiêu hóa"),
    ];
  }
}
