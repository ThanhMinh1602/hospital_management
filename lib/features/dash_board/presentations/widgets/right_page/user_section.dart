import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management/core/common/button/remove_button.dart';
import 'package:hospital_management/core/common/button/square_button.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
import 'package:hospital_management/core/model/role_group/account_group.dart';
import 'package:hospital_management/core/model/role_group/dept_group_role.dart';
import 'package:hospital_management/features/dash_board/presentations/bloc/dashboard_bloc.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/custom_table_cell.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_page/right_section.dart';
import 'package:hospital_management/gen/assets.gen.dart';

class UserSection extends StatelessWidget {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return RightSection(
          sectionOnPressedSave: () {},
          title: '2. NGƯỜI DÙNG',
          child: Column(
            children: [
              const SizedBox(height: 6.0),
              Row(
                children: [
                  _buildTabarItem(
                    backgroundColor: state.curentTableUser == 0
                        ? const Color.fromARGB(255, 241, 253, 255)
                        : AppColor.c_F2F2F2,
                    title: 'Khoa Phòng',
                    onTap: () => context
                        .read<DashboardBloc>()
                        .add(const DashboardEvent.changeTableUser(0)),
                  ),
                  const SizedBox(width: 4.0),
                  _buildTabarItem(
                    backgroundColor: state.curentTableUser == 1
                        ? const Color.fromARGB(255, 241, 253, 255)
                        : AppColor.c_F2F2F2,
                    title: 'Tài Khoản',
                    onTap: () => context
                        .read<DashboardBloc>()
                        .add(const DashboardEvent.changeTableUser(1)),
                  ),
                ],
              ),
              _buildHeaderUserSection(state, context),
              _buildTableUser(context, state,
                  currentTable: state.curentTableUser)
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabarItem(
      {void Function()? onTap,
      required String title,
      required Color backgroundColor}) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 44.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(4.0)),
            ),
            child: Text(title, style: AppStyle.tabTitle),
          ),
        );
      },
    );
  }

  Widget _buildHeaderUserSection(DashboardState state, BuildContext context) {
    final isDeptGroup = state.curentTableUser == 0;
    final selectedValue =
        isDeptGroup ? state.deptGroupRole : state.accountGroup;
    final items = isDeptGroup
        ? state.roleGroup?.deptGroupRoles
            .map((e) => DropdownMenuItem<DeptGroupRole>(
                  value: e,
                  child: Text(e.deptName),
                ))
            .toList()
        : state.roleGroup?.accountGroups
            .map((e) => DropdownMenuItem<AccountGroup>(
                  value: e,
                  child: Text(e.accountName),
                ))
            .toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 4.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 241, 253, 255),
      ),
      child: Row(
        children: [
          Text(
            isDeptGroup ? 'Khoa Phòng' : 'Tài Khoản',
            style: AppStyle.tabTitle,
          ),
          const SizedBox(width: 8.0),
          DropdownButtonFormField<dynamic>(
            decoration: InputDecoration(
              constraints:
                  const BoxConstraints(maxWidth: 202.0, maxHeight: 40.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide:
                    const BorderSide(color: AppColor.c_979797, width: 0.5),
              ),
            ),
            hint: Text(isDeptGroup ? 'Chọn phòng khoa' : 'Chọn Tài khoản'),
            value: selectedValue,
            items: items,
            onChanged: (value) {
              if (isDeptGroup) {
                if (value is DeptGroupRole) {
                  context.read<DashboardBloc>().add(
                        DashboardEvent.selectDeptGroupRole(value),
                      );
                }
              } else {
                if (value is AccountGroup) {
                  context.read<DashboardBloc>().add(
                        DashboardEvent.selectAccountGroup(value),
                      );
                }
              }
            },
          ),
          const SizedBox(width: 15.0),
          AppSquareButton(
            iconPath: Assets.icons.dropIcon,
            onTap: () {
              if (isDeptGroup) {
                context.read<DashboardBloc>().add(
                    DashboardEvent.addDeptGroupRoleToList(
                        state.deptGroupRole!));
              } else {
                context.read<DashboardBloc>().add(
                    DashboardEvent.addAccountGroupToList(state.accountGroup!));
              }
            },
          ),
          const SizedBox(width: 7.0),
          RemoveButton(
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTableUser(BuildContext context, DashboardState state,
      {required int currentTable}) {
    bool isDept = (currentTable == 0);

    // Choose the appropriate list based on the value of currentTable
    var dataList = isDept ? state.deptGroupRoles : state.accountGroups;

    return Table(
      border: const TableBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(6.0),
        ),
      ),
      columnWidths: const {
        0: FlexColumnWidth(1.0),
        1: FlexColumnWidth(3.5),
        2: FlexColumnWidth(7.5),
        3: FlexColumnWidth(1.5),
      },
      children: [
        _buildHeaderTableUser(current: currentTable),
        for (var data in dataList)
          _buildRowTableUser(
            context,
            current: currentTable,
            id: isDept ? (data as DeptGroupRole).id : (data as AccountGroup).id,
            code: isDept
                ? (data as DeptGroupRole).deptCode
                : (data as AccountGroup).accountCode,
            name: isDept
                ? (data as DeptGroupRole).deptName
                : (data as AccountGroup).accountName,
          ),
      ],
    );
  }

  TableRow _buildHeaderTableUser({required int current}) {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColor.c_C8E7CA,
      ),
      children: [
        const CustomTableCell(text: '', isHeader: true),
        CustomTableCell(
            text: current == 0 ? 'Mã khoa phòng' : 'Mã tài khoản',
            isHeader: true),
        CustomTableCell(
          text: current == 0 ? 'Tên khoa phòng' : 'Mã khoa phòng',
          isHeader: true,
        ),
        const CustomTableCell(text: '', isHeader: true),
      ],
    );
  }

  TableRow _buildRowTableUser(BuildContext context,
      {required int current,
      required String code,
      required String name,
      required int id}) {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColor.c_FFFFFF,
      ),
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        CustomTableCell(text: code),
        CustomTableCell(
          text: name,
        ),
        _buildDeleteButton(
          onTap: () {
            if (current == 0) {
              context.read<DashboardBloc>().add(
                    DashboardEvent.unSelectDept(id),
                  );
            } else {
              context.read<DashboardBloc>().add(
                    DashboardEvent.unSelectAccount(id),
                  );
            }
          },
        ),
      ],
    );
  }

  Widget _buildDeleteButton({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: AppSquareButton(iconPath: Assets.icons.deleteIcon))),
    );
  }
}
