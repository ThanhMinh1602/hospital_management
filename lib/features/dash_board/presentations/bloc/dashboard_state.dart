part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(false) bool isLoading,
    @Default(false) bool isSelectGroupRole,
    @Default(2) int groupStatus,
    @Default(0) int curentTableUser,
    @Default([]) List<RoleGroupSimple> roleGroupSimples,
    @Default([]) List<bool> isExpandedList, // Trạng thái mở rộng của hàng chính
    @Default([])
    List<List<bool>> subLevelExpandedList, // Trạng thái mở rộng của hàng con
    RoleGroupSimple? roleGroupSimple,
  }) = _DashboardState;
}
