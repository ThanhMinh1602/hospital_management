part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.init() = DashboardInitEvent;
  const factory DashboardEvent.selectGroupRole() = SelectGroupRoleEvent;
  const factory DashboardEvent.filterGroupStatus(int status) =
      FilterGroupStatusEvent;
  const factory DashboardEvent.deleteGroupStatus(int status) =
      deleteGroupStatusEvent;
  const factory DashboardEvent.changeTableUser(int curentTableUser) =
      ChangeTabelUserEvent;
  const factory DashboardEvent.onTapDetailRole(
      RoleGroupSimple roleGroupSimple) = TapDetailRoleEvent;

  // Thêm sự kiện cho việc mở rộng hàng
  const factory DashboardEvent.toggleExpand(int index) = ToggleExpandEvent;
  const factory DashboardEvent.toggleSubExpand(int index, int subIndex) =
      ToggleSubExpandEvent;
}
