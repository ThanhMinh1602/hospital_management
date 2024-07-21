import 'package:flutter/material.dart';
import 'package:hospital_management/core/common/header/app_header.dart';
import 'package:hospital_management/features/assign_role/presentations/widgets/left_page/assign_role_left_page.dart';
import 'package:hospital_management/features/assign_role/presentations/widgets/right_page/assign_role_right_page.dart';

class AssignRoleWidget extends StatelessWidget {
  const AssignRoleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppHeader(),
        body: Row(
          children: [
            AssignRoleLeftPage(),
            SizedBox(width: 8.0),
            AssignRoleRightPage()
          ],
        ));
  }
}
