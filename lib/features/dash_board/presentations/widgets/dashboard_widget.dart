import 'package:flutter/material.dart';
import 'package:hospital_management/core/common/header/app_header.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/left_page/dashboard_left_page.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_page/dashboard_right_page.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppHeader(),
        body: Row(
          children: [
            DashBoardLeftPage(),
            SizedBox(width: 8.0),
            RightPage(),
          ],
        ));
  }
}
