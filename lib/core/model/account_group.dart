class AccountGroup {
  int id;
  String userName;
  String fullName;
  String password;

  AccountGroup({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.password,
  });

  factory AccountGroup.fromJson(Map<String, dynamic> json) {
    return AccountGroup(
      id: json['id'],
      userName: json['UserName'],
      fullName: json['FullName'],
      password: json['PassWord'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'UserName': userName,
      'FullName': fullName,
      'PassWord': password,
    };
  }
}
