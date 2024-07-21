import 'package:hospital_management/core/model/screen_sub.dart';

class Screen {
  final int id;
  final String screenCode;
  final String screenName;
  final String role;
  final ScreenSub screenSub;

  Screen({
    required this.id,
    required this.screenCode,
    required this.screenName,
    required this.role,
    required this.screenSub,
  });

  factory Screen.fromJson(Map<String, dynamic> json) {
    return Screen(
      id: json['id'],
      screenCode: json['ScreenCode'],
      screenName: json['ScreenName'],
      role: json['Role'],
      screenSub: ScreenSub.fromJson(json['ScreenSub']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ScreenCode': screenCode,
      'ScreenName': screenName,
      'Role': role,
      'ScreenSub': screenSub.toJson(),
    };
  }
}
