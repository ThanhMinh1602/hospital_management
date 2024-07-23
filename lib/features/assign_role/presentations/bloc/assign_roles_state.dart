part of 'assign_roles_bloc.dart';

@freezed
class AssignRolesState with _$AssignRolesState {
  const factory AssignRolesState({
    @Default([]) List<bool> isExpandedList,
    @Default([]) List<Screen> screens,
    @Default([]) List<List<bool>> subLevelExpandedList,
    @Default([]) List<bool> rightIsExpandedList, 
  }) = _AssignRolesState;
}
