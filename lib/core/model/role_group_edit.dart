import 'role_group.dart';
import 'screen.dart';

class RoleGroupEdit {
  RoleGroup roleGroup;
  List<int> deptGroupRole;
  List<int> accountGroup;
  Screen screen;

  RoleGroupEdit({
    required this.roleGroup,
    required this.deptGroupRole,
    required this.accountGroup,
    required this.screen,
  });

  factory RoleGroupEdit.fromJson(Map<String, dynamic> json) {
    return RoleGroupEdit(
      roleGroup: RoleGroup.fromJson(json['RoleGroup']),
      deptGroupRole: List<int>.from(json['DeptGroupRole']),
      accountGroup: List<int>.from(json['AccountGroup']),
      screen: Screen.fromJson(json['Screen']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RoleGroup': roleGroup.toJson(),
      'DeptGroupRole': List<dynamic>.from(deptGroupRole.map((x) => x)),
      'AccountGroup': List<dynamic>.from(accountGroup.map((x) => x)),
      'Screen': screen.toJson(),
    };
  }
}
