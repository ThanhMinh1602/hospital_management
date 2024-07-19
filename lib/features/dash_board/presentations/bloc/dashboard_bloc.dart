// ignore_for_file: await_only_futures

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management/core/model/role_group_simple.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on(onInit);
    on(onSelectGroupRole);
    on(onFilterStatus);
    add(const DashboardEvent.init());
  }
}

extension HandlerDashboardBloc on DashboardBloc {
  Future<void> onInit(
      DashboardInitEvent event, Emitter<DashboardState> emitter) async {
    final roleGroupSimples = await RoleGroupSimple.roleGroupSimpleDatas;
    emitter(state.copyWith(roleGroupSimples: roleGroupSimples));
  }

  void onSelectGroupRole(
      SelectGroupRoleEvent event, Emitter<DashboardState> emitter) {
    bool isSelectGroupRole = !state.isSelectGroupRole;
    emitter(state.copyWith(isSelectGroupRole: isSelectGroupRole));
  }

  void onFilterStatus(
      FilterGroupStatusEvent event, Emitter<DashboardState> emitter) {
    final dataByStatus = RoleGroupSimple.roleGroupSimpleDatas;
    List<RoleGroupSimple> datas = [];
    int groupStatus = event.status;
    if (groupStatus != 2) {
      datas = dataByStatus
          .where((element) => element.status == groupStatus)
          .toList();
    } else {
      datas = dataByStatus;
    }

    emitter(state.copyWith(groupStatus: groupStatus, roleGroupSimples: datas));
  }

  void onDeleteGroupRole(
      deleteGroupStatusEvent event, Emitter<DashboardState> emitter) {}
}
