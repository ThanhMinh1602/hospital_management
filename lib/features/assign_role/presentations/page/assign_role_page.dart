import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management/features/assign_role/presentations/binding/assign_role_binding.dart';
import 'package:hospital_management/features/assign_role/presentations/widgets/assign_role_widget.dart';

class AssignRolePage extends StatelessWidget {
  const AssignRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: AssignRoleBinding.generateBloc,
      child: AssignRoleWidget(),
    );
  }
}
