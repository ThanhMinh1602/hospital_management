import 'package:flutter/material.dart';
import 'package:hospital_management/features/assign_role/presentations/page/assign_role_page.dart';
import 'package:hospital_management/features/dash_board/presentations/page/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashBoardPage(),
    );
  }
}
