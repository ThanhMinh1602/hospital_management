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
    on(onChangeTableUser);
    on(onToggleExpand);
    on(onToggleSubExpand);
    on(onDetaiRole);
    on(_onToggleActions);
    add(const DashboardEvent.init());
  }

  Future<void> onInit(
      DashboardInitEvent event, Emitter<DashboardState> emitter) async {
    final roleGroupSimples = await RoleGroupSimple.roleGroupSimpleDatas;
    emitter(state.copyWith(
      roleGroupSimples: roleGroupSimples,
      isExpandedList: List.generate(roleGroupSimples.length, (_) => false),
      subLevelExpandedList:
          List.generate(roleGroupSimples.length, (_) => [false]),
    ));
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

  void onChangeTableUser(
      ChangeTabelUserEvent event, Emitter<DashboardState> emitter) {
    final curentTableUser = event.curentTableUser;
    emitter(state.copyWith(curentTableUser: curentTableUser));
  }

  void onDetaiRole(TapDetailRoleEvent event, Emitter<DashboardState> emitter) {
    final roleGroupSimple = event.roleGroupSimple;
    emitter(state.copyWith(roleGroupSimple: roleGroupSimple));
  }

  void onToggleExpand(
      ToggleExpandEvent event, Emitter<DashboardState> emitter) {
    final index = event.index;
    List<bool> newIsExpandedList = List.from(state.isExpandedList);
    newIsExpandedList[index] = !newIsExpandedList[index];
    emitter(state.copyWith(isExpandedList: newIsExpandedList));
  }

  void onToggleSubExpand(
      ToggleSubExpandEvent event, Emitter<DashboardState> emitter) {
    final index = event.index;
    final subIndex = event.subIndex;
    final newSubLevelExpandedList =
        List<List<bool>>.from(state.subLevelExpandedList);
    newSubLevelExpandedList[index] = List.from(newSubLevelExpandedList[index]);
    newSubLevelExpandedList[index][subIndex] =
        !newSubLevelExpandedList[index][subIndex];
    emitter(state.copyWith(subLevelExpandedList: newSubLevelExpandedList));
  }

  void _onToggleActions(
      ToggleActionsEvent event, Emitter<DashboardState> emitter) {
    final newActionsVisibleList =
        List<List<List<bool>>>.from(state.actionsVisibleList);
    newActionsVisibleList[event.index][event.subIndex][event.subSubIndex] =
        !newActionsVisibleList[event.index][event.subIndex][event.subSubIndex];
    emitter(state.copyWith(actionsVisibleList: newActionsVisibleList));
  }
}
