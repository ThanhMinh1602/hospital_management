import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management/core/model/screen.dart';

part 'assign_roles_event.dart';
part 'assign_roles_state.dart';
part 'assign_roles_bloc.freezed.dart';

class AssignRolesBloc extends Bloc<AssignRolesEvent, AssignRolesState> {
  AssignRolesBloc() : super(const AssignRolesState()) {
    on(onInit);
    on(onToggleExpand);
    on(onToggleSubExpand);
    add(const AssignRolesEvent.initial());
  }
  Future<void> onInit(
      AssignRolesInitialEvent event, Emitter<AssignRolesState> emitter) async {
    final screens = Screen.generateFakeData();
    emitter(state.copyWith(
      screens: screens,
      isExpandedList: List.generate(screens.length, (_) => false),
      subLevelExpandedList: List.generate(screens.length, (_) => [false]),
    ));
  }

  void onToggleExpand(
      ToggleExpandEvent event, Emitter<AssignRolesState> emitter) {
    final index = event.index;
    List<bool> newIsExpandedList = List.from(state.isExpandedList);
    newIsExpandedList[index] = !newIsExpandedList[index];
    emitter(state.copyWith(isExpandedList: newIsExpandedList));
  }

  void onToggleSubExpand(
      ToggleSubExpandEvent event, Emitter<AssignRolesState> emitter) {
    final index = event.index;
    final subIndex = event.subIndex;
    final newSubLevelExpandedList =
        List<List<bool>>.from(state.subLevelExpandedList);
    newSubLevelExpandedList[index] = List.from(newSubLevelExpandedList[index]);
    newSubLevelExpandedList[index][subIndex] =
        !newSubLevelExpandedList[index][subIndex];
    emitter(state.copyWith(subLevelExpandedList: newSubLevelExpandedList));
  }
}
