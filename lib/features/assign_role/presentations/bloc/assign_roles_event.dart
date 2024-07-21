part of 'assign_roles_bloc.dart';

@freezed
class AssignRolesEvent with _$AssignRolesEvent {
  const factory AssignRolesEvent.initial() = AssignRolesInitialEvent;
}
