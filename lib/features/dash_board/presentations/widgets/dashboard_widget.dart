import 'package:flutter/material.dart';
import 'package:hospital_management/core/common/header/app_header.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppHeader(),
      body: Center(
        child: Text('Dashboard widget'),
      ),
    );
  }
}
