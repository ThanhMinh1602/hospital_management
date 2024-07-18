import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management/features/dash_board/presentations/bingding/dashboard_binding.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/dashboard_widget.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: DashboadBinding.generateBloc,
      child: DashboardWidget(),
    );
  }
}
