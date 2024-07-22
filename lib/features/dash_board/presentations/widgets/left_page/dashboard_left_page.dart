import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/core/common/check_box/app_checkbox.dart';
import 'package:hospital_management/core/common/components/app_pagination.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
import 'package:hospital_management/core/model/role_group/role_group.dart';
import 'package:hospital_management/features/dash_board/presentations/bloc/dashboard_bloc.dart';
import 'package:hospital_management/gen/assets.gen.dart';

class DashBoardLeftPage extends StatefulWidget {
  const DashBoardLeftPage({super.key});

  @override
  State<DashBoardLeftPage> createState() => _DashBoardLeftPageState();
}

class _DashBoardLeftPageState extends State<DashBoardLeftPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColor.c_F8FAFC,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: BlocConsumer<DashboardBloc, DashboardState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  _buildLeftHeader(
                    onTapBack: () {},
                    onTapXLS: () {},
                    onTapRemove: () {},
                  ),
                  CustomCheckBox(
                    label: 'Chọn',
                    onChanged: (value) {
                      context
                          .read<DashboardBloc>()
                          .add(const DashboardEvent.selectGroupRole());
                    },
                    value: state.isAllowsMultiSelectGroupRole,
                  ),
                  _buildTable(context,
                      dataRows: state.roleGroups, state: state),
                  AppPagination(
                    onPageChanged: (value) {},
                    selectedPage: 1,
                    listPageCount: const [10, 20, 30, 40, 50],
                    pageCountValue: 10,
                    onChangedPagecount: (pageCount) {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLeftHeader({
    required VoidCallback onTapBack,
    required VoidCallback onTapXLS,
    required VoidCallback onTapRemove,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: onTapBack,
            child: SvgPicture.asset(Assets.icons.backIcon),
          ),
          const SizedBox(width: 5.0),
          _buildXlsIcon(onTap: onTapXLS),
          const SizedBox(width: 5.0),
          _buildRemoveButton(onTap: onTapRemove),
        ],
      ),
    );
  }

  Widget _buildXlsIcon({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 68.57,
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.c_006EA9,
          borderRadius: BorderRadius.circular(5.71),
          border: Border.all(
            color: AppColor.c_919EAB,
            width: 1.43,
          ),
        ),
        child: SvgPicture.asset(Assets.icons.xlsIcon, width: 22.86),
      ),
    );
  }

  Widget _buildRemoveButton({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 75.71,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.71),
          border: Border.all(
            color: AppColor.c_D84226,
            width: 1.43,
          ),
        ),
        child: SvgPicture.asset(Assets.icons.removeIcon),
      ),
    );
  }

  Widget _buildTable(BuildContext context,
      {required List<RoleGroup> dataRows, required DashboardState state}) {
    return Column(
      children: [
        Table(
          border: const TableBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(6.0),
            ),
          ),
          columnWidths: const {
            0: FlexColumnWidth(1.5),
            1: FlexColumnWidth(4.5),
            2: FlexColumnWidth(5.5),
            3: FlexColumnWidth(2.5),
          },
          children: [
            _buildTableHeader(),
            _buildTableFilter(state: state, context),
            for (int i = 0; i < dataRows.length; i++)
              _buildTableRow(
                onTapRow: () {
                  context
                      .read<DashboardBloc>()
                      .add(DashboardEvent.onTapDetailRole(dataRows[i]));
                },
                dataRows[i],
                index: i,
                state: state,
              ),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        _buildTableCell(text: 'STT', isHeader: true),
        _buildTableCell(text: 'Mã nhóm quyền', isHeader: true),
        _buildTableCell(text: 'Tên nhóm quyền', isHeader: true),
        _buildTableCell(text: 'Sử dụng', isHeader: true),
      ],
    );
  }

  TableRow _buildTableFilter(BuildContext context,
      {required DashboardState state}) {
    return TableRow(
      children: [
        Container(
          height: 40,
          color: AppColor.c_FFFFFF,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.centerRight,
          height: 40,
          color: AppColor.c_FFFFFF,
          child: SvgPicture.asset(Assets.icons.searchIcon),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.centerRight,
          height: 40,
          color: AppColor.c_FFFFFF,
          child: SvgPicture.asset(Assets.icons.searchIcon),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: AppColor.c_FFFFFF,
          child: DropdownButton<int>(
            value: state.groupStatus,
            underline: Container(),
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: 2,
                child: Text('Tất cả'),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text('Đã dùng'),
              ),
              DropdownMenuItem(
                value: 0,
                child: Text('Chưa dùng'),
              ),
            ],
            onChanged: (newValue) {
              context
                  .read<DashboardBloc>()
                  .add(DashboardEvent.filterGroupStatus(newValue!));
            },
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRow(RoleGroup roleGroupSimple,
      {required int index,
      required DashboardState state,
      void Function()? onTapRow}) {
    final isSelected = state.selectedRoleGroupIds.contains(roleGroupSimple.id);

    return TableRow(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColor.c_C8E7CA : AppColor.c_FFFFFF,
      ),
      children: [
        state.isAllowsMultiSelectGroupRole
            ? Checkbox(
                value: isSelected,
                onChanged: (value) {
                  if (value != null) {
                    context
                        .read<DashboardBloc>()
                        .add(DashboardEvent.toggleCheckbox(roleGroupSimple.id));
                  }
                },
              )
            : _buildTableCell(text: roleGroupSimple.id.toString()),
        _buildTableCell(text: roleGroupSimple.roleCode, onTap: onTapRow),
        _buildTableCell(text: roleGroupSimple.roleName, onTap: onTapRow),
        Checkbox(
          value: roleGroupSimple.isUse == 1,
          onChanged: null,
        ),
      ],
    );
  }

  Widget _buildTableCell(
      {required String text, bool? isHeader, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isHeader == true ? 48.0 : 40,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(
              color: AppColor.c_FFFFFF,
              width: 1,
            ),
          ),
        ),
        child: Text(
          text,
          style: isHeader == true ? AppStyle.tableHeader : AppStyle.tableRow,
        ),
      ),
    );
  }
}
