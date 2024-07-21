import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assign_roles_event.dart';
part 'assign_roles_state.dart';
part 'assign_roles_bloc.freezed.dart';

class AssignRolesBloc extends Bloc<AssignRolesEvent, AssignRolesState> {
  AssignRolesBloc() : super(const AssignRolesState()) {
    on<AssignRolesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
