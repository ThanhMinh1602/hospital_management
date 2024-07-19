import 'package:flutter/material.dart';
import 'package:hospital_management/core/common/header/app_header.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/left_page.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_page.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppHeader(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  LeftPage(),
                  SizedBox(width: 8.0),
                  RightPage(),
                ],
              ),
            ],
          ),
        ));
  }
}
