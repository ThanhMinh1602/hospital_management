part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.init() = DashboardInitEvent;
  const factory DashboardEvent.selectGroupRole() = SelectGroupRoleEvent;
  const factory DashboardEvent.allowsMultiSelectDectRole() =
      AllowsMultiSelectDectRoleEvent;
  const factory DashboardEvent.filterGroupStatus(int status) =
      FilterGroupStatusEvent;
  const factory DashboardEvent.deleteGroupStatus(int status) =
      deleteGroupStatusEvent;
  const factory DashboardEvent.deleteMultiGroupStatus(int id) =
      DeleteMultiGroupStatusEvent;
  const factory DashboardEvent.changeTableUser(int curentTableUser) =
      ChangeTabelUserEvent;
  const factory DashboardEvent.onTapDetailRole(RoleGroup roleGroupSimple) =
      TapDetailRoleEvent;
  const factory DashboardEvent.toggleActions(
      int index, int subIndex, int subSubIndex) = ToggleActionsEvent;
  // Thêm sự kiện cho việc mở rộng hàng
  const factory DashboardEvent.toggleExpand(int index) = ToggleExpandEvent;
  const factory DashboardEvent.toggleSubExpand(int index, int subIndex) =
      ToggleSubExpandEvent;
  const factory DashboardEvent.toggleSubSubExpand(
      int index, int subIndex, int subSubIndex) = ToggleSubSubExpandEvent;
  const factory DashboardEvent.toggleCheckbox(int roleGroupId) =
      ToggleCheckboxEvent;
  const factory DashboardEvent.toggleCheckboxDectRole(int roleDectRoleId) =
      ToggleCheckboxDectRoleEvent;
  const factory DashboardEvent.selectDeptGroupRole(
      DeptGroupRole deptGroupRole) = SelectDeptGroupRoleEvent;
  const factory DashboardEvent.selectAccountGroup(AccountGroup accountGroup) =
      SelectAccountGroupEvent;
  const factory DashboardEvent.addDeptGroupRoleToList(
      DeptGroupRole deptGroupRole) = AddDeptGroupRoleToListEvent;
  const factory DashboardEvent.addAccountGroupToList(
      AccountGroup accountGroup) = AddAccountGroupToListEvent;
}
