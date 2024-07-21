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

  static List<AccountGroup> generateFakeData() {
    return [
      AccountGroup(
          id: 1,
          userName: "user1",
          fullName: "Full Name 1",
          password: "password1"),
      AccountGroup(
          id: 2,
          userName: "user2",
          fullName: "Full Name 2",
          password: "password2"),
      AccountGroup(
          id: 3,
          userName: "user3",
          fullName: "Full Name 3",
          password: "password3"),
      AccountGroup(
          id: 4,
          userName: "user4",
          fullName: "Full Name 4",
          password: "password4"),
      AccountGroup(
          id: 5,
          userName: "user5",
          fullName: "Full Name 5",
          password: "password5"),
      AccountGroup(
          id: 6,
          userName: "user6",
          fullName: "Full Name 6",
          password: "password6"),
      AccountGroup(
          id: 7,
          userName: "user7",
          fullName: "Full Name 7",
          password: "password7"),
      AccountGroup(
          id: 8,
          userName: "user8",
          fullName: "Full Name 8",
          password: "password8"),
      AccountGroup(
          id: 9,
          userName: "user9",
          fullName: "Full Name 9",
          password: "password9"),
      AccountGroup(
          id: 10,
          userName: "user10",
          fullName: "Full Name 10",
          password: "password10"),
    ];
  }
}
