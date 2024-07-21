class AccountGroup {
  final int id;
  final String userName;
  final String fullName;
  final String passWord;

  AccountGroup({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.passWord,
  });

  factory AccountGroup.fromJson(Map<String, dynamic> json) {
    return AccountGroup(
      id: json['id'],
      userName: json['UserName'],
      fullName: json['FullName'],
      passWord: json['passWord'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'UserName': userName,
      'FullName': fullName,
      'passWord': passWord,
    };
  }

  static List<AccountGroup> generateFakeData() {
    return [
      AccountGroup(
          id: 1,
          userName: "user1",
          fullName: "Full Name 1",
          passWord: "passWord1"),
      AccountGroup(
          id: 2,
          userName: "user2",
          fullName: "Full Name 2",
          passWord: "passWord2"),
      AccountGroup(
          id: 3,
          userName: "user3",
          fullName: "Full Name 3",
          passWord: "passWord3"),
      AccountGroup(
          id: 4,
          userName: "user4",
          fullName: "Full Name 4",
          passWord: "passWord4"),
      AccountGroup(
          id: 5,
          userName: "user5",
          fullName: "Full Name 5",
          passWord: "passWord5"),
      AccountGroup(
          id: 6,
          userName: "user6",
          fullName: "Full Name 6",
          passWord: "passWord6"),
      AccountGroup(
          id: 7,
          userName: "user7",
          fullName: "Full Name 7",
          passWord: "passWord7"),
      AccountGroup(
          id: 8,
          userName: "user8",
          fullName: "Full Name 8",
          passWord: "passWord8"),
      AccountGroup(
          id: 9,
          userName: "user9",
          fullName: "Full Name 9",
          passWord: "passWord9"),
      AccountGroup(
          id: 10,
          userName: "user10",
          fullName: "Full Name 10",
          passWord: "passWord10"),
    ];
  }
}
