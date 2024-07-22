// ignore_for_file: await_only_futures

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management/core/model/role_group/account_group.dart';
import 'package:hospital_management/core/model/role_group/dept_group_role.dart';
import 'package:hospital_management/core/model/role_group/role_group.dart';

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
    on(onToggleActions);
    on(onToggleCheckbox);
    on(onAllowsMultiSelectDectRole);
    on(onSelectDeptGroupRole);
    on(onSelectAccountGroup);
    on(onAddAccountGroupToList);
    on(onAddDeptGroupRoleToList);
    add(const DashboardEvent.init());
  }

  Future<void> onInit(
      DashboardInitEvent event, Emitter<DashboardState> emitter) async {
    final roleGroups = await RoleGroup.generateDatas;
    emitter(state.copyWith(
      roleGroups: roleGroups,
      isExpandedList: List.generate(roleGroups.length, (_) => false),
      subLevelExpandedList: List.generate(roleGroups.length, (_) => [false]),
    ));
  }

  void onSelectGroupRole(
      SelectGroupRoleEvent event, Emitter<DashboardState> emitter) {
    bool isSelectGroupRole = !state.isAllowsMultiSelectGroupRole;
    emitter(state.copyWith(isAllowsMultiSelectGroupRole: isSelectGroupRole));
  }

  void onToggleCheckbox(
      ToggleCheckboxEvent event, Emitter<DashboardState> emitter) {
    final selectedRoleGroupIds = List<int>.from(state.selectedRoleGroupIds);
    final roleGroupId = event.roleGroupId;

    if (selectedRoleGroupIds.contains(roleGroupId)) {
      selectedRoleGroupIds.remove(roleGroupId);
    } else {
      selectedRoleGroupIds.add(roleGroupId);
    }

    emitter(state.copyWith(selectedRoleGroupIds: selectedRoleGroupIds));
  }

  void onFilterStatus(
      FilterGroupStatusEvent event, Emitter<DashboardState> emitter) {
    final dataByStatus = RoleGroup.generateDatas;
    List<RoleGroup> datas = [];
    int groupStatus = event.status;
    if (groupStatus != 2) {
      datas = dataByStatus
          .where((element) => element.isUse == groupStatus)
          .toList();
    } else {
      datas = dataByStatus;
    }

    emitter(state.copyWith(groupStatus: groupStatus, roleGroups: datas));
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
    emitter(state.copyWith(roleGroup: roleGroupSimple));
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

  void onToggleActions(
      ToggleActionsEvent event, Emitter<DashboardState> emitter) {
    final newActionsVisibleList =
        List<List<List<bool>>>.from(state.actionsVisibleList);
    newActionsVisibleList[event.index][event.subIndex][event.subSubIndex] =
        !newActionsVisibleList[event.index][event.subIndex][event.subSubIndex];
    emitter(state.copyWith(actionsVisibleList: newActionsVisibleList));
  }

  void onAllowsMultiSelectDectRole(
      AllowsMultiSelectDectRoleEvent event, Emitter<DashboardState> emitter) {
    bool isAllowsMultiSelectDecentralizationRole =
        !state.isAllowsMultiSelectDecentralizationRole;
    emitter(state.copyWith(
        isAllowsMultiSelectDecentralizationRole:
            isAllowsMultiSelectDecentralizationRole));
  }

  void onSelectDeptGroupRole(
      SelectDeptGroupRoleEvent event, Emitter<DashboardState> emittter) {
    emittter(state.copyWith(deptGroupRole: event.deptGroupRole));
  }

  void onAddDeptGroupRoleToList(
      AddDeptGroupRoleToListEvent event, Emitter<DashboardState> emitter) {
    final List<DeptGroupRole> updatedDeptGroupRoles =
        List.from(state.deptGroupRoles)..add(event.deptGroupRole);
    emitter(state.copyWith(deptGroupRoles: updatedDeptGroupRoles));
  }

  void onSelectAccountGroup(
      SelectAccountGroupEvent event, Emitter<DashboardState> emittter) {
    emittter(state.copyWith(accountGroup: event.accountGroup));
  }

  void onAddAccountGroupToList(
      AddAccountGroupToListEvent event, Emitter<DashboardState> emitter) {
    final List<AccountGroup> updatedAccountGroups =
        List.from(state.accountGroups)..add(event.accountGroup);

    emitter(state.copyWith(accountGroups: updatedAccountGroups));
  }
}
