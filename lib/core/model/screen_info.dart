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

  // static List<ScreenInfo> generateFakeData() {
  //   return [
  //     ScreenInfo(
  //       screenCode: 'E01L00001',
  //       screenName: 'Hồ sơ điều trị',
  //       screenSub: ScreenSub.generateFakeData()[0],
  //     ),
  //     ScreenInfo(
  //       screenCode: 'E01L00002',
  //       screenName: 'Hồ sơ bệnh nhân',
  //       screenSub: ScreenSub.generateFakeData()[1],
  //     ),
  //     ScreenInfo(
  //       screenCode: 'E01L00003',
  //       screenName: 'Hồ sơ y tá',
  //       screenSub: ScreenSub.generateFakeData()[2],
  //     ),
  //     ScreenInfo(
  //       screenCode: 'E01L00004',
  //       screenName: 'Hồ sơ phẫu thuật',
  //       screenSub: ScreenSub.generateFakeData()[3],
  //     ),
  //     ScreenInfo(
  //       screenCode: 'E01L00005',
  //       screenName: 'Hồ sơ bác sĩ',
  //       screenSub: ScreenSub.generateFakeData()[4],
  //     ),
  //   ];
  // }
}
