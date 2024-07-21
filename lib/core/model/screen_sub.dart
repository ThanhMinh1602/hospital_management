class ScreenSub {
  final String screenCode;
  final String screenName;
  final String role;

  ScreenSub({
    required this.screenCode,
    required this.screenName,
    required this.role,
  });

  factory ScreenSub.fromJson(Map<String, dynamic> json) {
    return ScreenSub(
      screenCode: json['ScreenCode'],
      screenName: json['ScreenName'],
      role: json['Role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ScreenCode': screenCode,
      'ScreenName': screenName,
      'Role': role,
    };
  }
}
