import 'role_group.dart';
import 'dept_group_role.dart';
import 'account_group.dart';
import 'screen.dart';

class RoleGroupResponse {
  RoleGroup roleGroup;
  DeptGroupRole deptGroupRole;
  AccountGroup accountGroup;
  Screen screen;

  RoleGroupResponse({
    required this.roleGroup,
    required this.deptGroupRole,
    required this.accountGroup,
    required this.screen,
  });

  factory RoleGroupResponse.fromJson(Map<String, dynamic> json) {
    return RoleGroupResponse(
      roleGroup: RoleGroup.fromJson(json['RoleGroup']),
      deptGroupRole: DeptGroupRole.fromJson(json['DeptGroupRole']),
      accountGroup: AccountGroup.fromJson(json['AccountGroup']),
      screen: Screen.fromJson(json['Screen']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RoleGroup': roleGroup.toJson(),
      'DeptGroupRole': deptGroupRole.toJson(),
      'AccountGroup': accountGroup.toJson(),
      'Screen': screen.toJson(),
    };
  }
}
