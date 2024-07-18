import 'package:hospital_management/core/model/screen_sub.dart';

class ScreenInfo {
  String screenCode;
  String screenName;
  ScreenSub screenSub;

  ScreenInfo({
    required this.screenCode,
    required this.screenName,
    required this.screenSub,
  });

  factory ScreenInfo.fromJson(Map<String, dynamic> json) {
    return ScreenInfo(
      screenCode: json['ScreenCode'],
      screenName: json['ScreenName'],
      screenSub: ScreenSub.fromJson(json['ScreenSub']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ScreenCode': screenCode,
      'ScreenName': screenName,
      'ScreenSub': screenSub.toJson(),
    };
  }
}
