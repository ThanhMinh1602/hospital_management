part of 'assign_roles_bloc.dart';

@freezed
class AssignRolesEvent with _$AssignRolesEvent {
  const factory AssignRolesEvent.initial() = AssignRolesInitialEvent;
  const factory AssignRolesEvent.toggleExpand(int index) = ToggleExpandEvent;
  const factory AssignRolesEvent.toggleSubExpand(int index, int subIndex) =
      ToggleSubExpandEvent;
}
