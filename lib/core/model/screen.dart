import 'screen_sub.dart';

class Screen {
  int id;
  String screenCode;
  String screenName;
  List<int> role;
  ScreenSub? screenSub;

  Screen({
    required this.id,
    required this.screenCode,
    required this.screenName,
    required this.role,
    this.screenSub,
  });

  factory Screen.fromJson(Map<String, dynamic> json) {
    return Screen(
      id: json['id'],
      screenCode: json['ScreenCode'],
      screenName: json['ScreenName'],
      role: List<int>.from(json['Role'].map((x) => x)),
      screenSub: json['ScreenSub'] != null
          ? ScreenSub.fromJson(json['ScreenSub'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ScreenCode': screenCode,
      'ScreenName': screenName,
      'Role': List<dynamic>.from(role.map((x) => x)),
      'ScreenSub': screenSub?.toJson(),
    };
  }
}
