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

  // Dữ liệu giả cho Screen
  static List<Screen> generateFakeData() {
    return [
      Screen(
        id: 1,
        screenCode: 'SCR001',
        screenName: 'Dashboard',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[0],
      ),
      Screen(
        id: 2,
        screenCode: 'SCR002',
        screenName: 'User Management',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[1],
      ),
      Screen(
        id: 3,
        screenCode: 'SCR003',
        screenName: 'Settings',
        role: 'User',
        screenSub: ScreenSub.generateFakeData()[2],
      ),
      Screen(
        id: 1,
        screenCode: 'SCR001',
        screenName: 'Dashboard',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[0],
      ),
      Screen(
        id: 2,
        screenCode: 'SCR002',
        screenName: 'User Management',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[1],
      ),
      Screen(
        id: 3,
        screenCode: 'SCR003',
        screenName: 'Settings',
        role: 'User',
        screenSub: ScreenSub.generateFakeData()[2],
      ),
      Screen(
        id: 1,
        screenCode: 'SCR001',
        screenName: 'Dashboard',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[0],
      ),
      Screen(
        id: 2,
        screenCode: 'SCR002',
        screenName: 'User Management',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[1],
      ),
      Screen(
        id: 3,
        screenCode: 'SCR003',
        screenName: 'Settings',
        role: 'User',
        screenSub: ScreenSub.generateFakeData()[2],
      ),
      Screen(
        id: 1,
        screenCode: 'SCR001',
        screenName: 'Dashboard',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[0],
      ),
      Screen(
        id: 2,
        screenCode: 'SCR002',
        screenName: 'User Management',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[1],
      ),
      Screen(
        id: 3,
        screenCode: 'SCR003',
        screenName: 'Settings',
        role: 'User',
        screenSub: ScreenSub.generateFakeData()[2],
      ),
      Screen(
        id: 1,
        screenCode: 'SCR001',
        screenName: 'Dashboard',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[0],
      ),
      Screen(
        id: 2,
        screenCode: 'SCR002',
        screenName: 'User Management',
        role: 'Admin',
        screenSub: ScreenSub.generateFakeData()[1],
      ),
      Screen(
        id: 3,
        screenCode: 'SCR003',
        screenName: 'Settings',
        role: 'User',
        screenSub: ScreenSub.generateFakeData()[2],
      ),
    ];
  }
}
