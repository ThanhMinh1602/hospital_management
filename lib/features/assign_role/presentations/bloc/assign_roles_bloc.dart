import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hospital_management/core/model/role_group/role_group.dart';
import 'package:hospital_management/core/model/role_group/screen.dart';

part 'assign_roles_event.dart';
part 'assign_roles_state.dart';
part 'assign_roles_bloc.freezed.dart';

class AssignRolesBloc extends Bloc<AssignRolesEvent, AssignRolesState> {
  AssignRolesBloc() : super(const AssignRolesState()) {
    on(onInit);
    on(onToggleExpand);
    on(onToggleSubExpand);
    on(onToggleRightExpand);
    add(const AssignRolesEvent.initial());
  }
  void onInit(
      AssignRolesInitialEvent event, Emitter<AssignRolesState> emitter) async {
    final screens = RoleGroup.generateDatas[1].screens;

    emitter(state.copyWith(
      screens: screens,
      isExpandedList: List.generate(screens.length, (_) => false),
      subLevelExpandedList: List.generate(screens.length, (_) => [false]),
      rightIsExpandedList: List.generate(
          5, (_) => false), // Thay đổi theo số lượng phần tử bạn có
    ));
  }

  void onToggleRightExpand(
      ToggleRightExpandEvent event, Emitter<AssignRolesState> emitter) {
    final index = event.index;
    List<bool> newRightIsExpandedList = List.from(state.rightIsExpandedList);
    newRightIsExpandedList[index] = !newRightIsExpandedList[index];
    emitter(state.copyWith(rightIsExpandedList: newRightIsExpandedList));
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
