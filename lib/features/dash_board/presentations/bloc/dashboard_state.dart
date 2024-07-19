part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(false) bool isLoading,
    @Default(false) bool isSelectGroupRole,
    @Default(2) int groupStatus,
    @Default([]) List<RoleGroupSimple> roleGroupSimples,
  }) = _DashboardState;
}
