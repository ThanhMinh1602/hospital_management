class ScreenSub {
  String screenCode;
  String screenName;
  List<int> role;

  ScreenSub({
    required this.screenCode,
    required this.screenName,
    required this.role,
  });

  factory ScreenSub.fromJson(Map<String, dynamic> json) {
    return ScreenSub(
      screenCode: json['ScreenCode'],
      screenName: json['ScreenName'],
      role: List<int>.from(json['Role'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ScreenCode': screenCode,
      'ScreenName': screenName,
      'Role': List<dynamic>.from(role.map((x) => x)),
    };
  }
}
