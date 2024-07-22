part of 'assign_roles_bloc.dart';

@freezed
class AssignRolesState with _$AssignRolesState {
  const factory AssignRolesState({
    // @Default([]) List<Screen> screens,
    @Default([]) List<bool> isExpandedList, // Trạng thái mở rộng của hàng chính
    @Default([])
    List<List<bool>> subLevelExpandedList, // Trạng thái mở rộng của hàng con
  }) = _AssignRolesState;
}
