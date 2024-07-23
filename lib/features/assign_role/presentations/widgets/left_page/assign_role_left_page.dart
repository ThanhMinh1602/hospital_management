import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/core/common/check_box/app_checkbox.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
import 'package:hospital_management/features/assign_role/presentations/bloc/assign_roles_bloc.dart';
import 'package:hospital_management/features/dash_board/presentations/bloc/dashboard_bloc.dart';
import 'package:hospital_management/core/common/components/table_cell_drop.dart';
import 'package:hospital_management/gen/assets.gen.dart';

class AssignRoleLeftPage extends StatelessWidget {
  const AssignRoleLeftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignRolesBloc, AssignRolesState>(
      builder: (context, state) {
        return Flexible(
          flex: 2,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: AppColor.c_F8FAFC,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 14.5),
                  _buildLeftHeader(
                    onTapBack: () {},
                    onTapXLS: () {},
                  ),
                  CustomCheckBox(
                    label: 'Chọn',
                    onChanged: (value) {
                      context
                          .read<DashboardBloc>()
                          .add(const DashboardEvent.selectGroupRole());
                    },
                    value: true,
                  ),
                  _buildTableHeader(),
                  _buildTableBody(context, state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLeftHeader({
    required VoidCallback onTapBack,
    required VoidCallback onTapXLS,
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

  Widget _buildTableHeader() {
    return const Row(
      children: [
        TableCellDrop(
          isHeader: true,
          bgrColor: AppColor.c_D8F1FD,
          flex: 2,
          title: 'Mã',
        ),
        TableCellDrop(
          isHeader: true,
          bgrColor: AppColor.c_D8F1FD,
          flex: 3,
          title: 'Tên',
        ),
      ],
    );
  }

  Widget _buildTableBody(BuildContext context, AssignRolesState state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.screens.length,
      itemBuilder: (context, index) {
        final isExpanded = state.isExpandedList[index];
        final subExpandedList = state.subLevelExpandedList[index];
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                context
                    .read<AssignRolesBloc>()
                    .add(AssignRolesEvent.toggleExpand(index));
              },
              child: _buildRow(
                context: context,
                backgroundColor: AppColor.c_F0FAFE,
                code: state.screens[index].screenCode,
                name: state.screens[index].screenCode,
                padding: 10.0,
                isExpanded: isExpanded,
                hasArrow: true,
              ),
            ),
            if (isExpanded) ..._buildSubLevels(context, index, subExpandedList),
          ],
        );
      },
    );
  }

  List<Widget> _buildSubLevels(
      BuildContext context, int index, List<bool> subExpandedList) {
    final screen = context.read<AssignRolesBloc>().state.screens[index];
    return List.generate(subExpandedList.length, (subIndex) {
      final isSubExpanded = subExpandedList[subIndex];
      final sub = screen.screenSub;
      return Column(
        children: [
          GestureDetector(
            onTap: () => context
                .read<AssignRolesBloc>()
                .add(AssignRolesEvent.toggleSubExpand(index, subIndex)),
            child: _buildRow(
              context: context,
              backgroundColor: AppColor.c_FFFFFF,
              code: sub!.screenCode,
              name: sub.screenName,
              padding: 20.0,
              isExpanded: isSubExpanded,
              hasArrow: true,
            ),
          ),
          if (isSubExpanded)
            _buildRow(
              context: context,
              backgroundColor: AppColor.c_FFFFFF,
              code: sub.screenCode,
              name: sub.screenName,
              padding: 30.0,
              isExpanded: false,
              hasArrow: false,
            ),
        ],
      );
    });
  }

  Widget _buildRow({
    required BuildContext context,
    required Color backgroundColor,
    required String code,
    required String name,
    required double padding,
    required bool isExpanded,
    required bool hasArrow,
  }) {
    return Row(
      children: [
        TableCellDrop(
          bgrColor: backgroundColor,
          flex: 2,
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            children: [
              if (hasArrow)
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  size: 16,
                ),
              SizedBox(width: padding / 2),
              Text(
                code,
                style: AppStyle.tableRow,
              ),
            ],
          ),
        ),
        TableCellDrop(
          bgrColor: backgroundColor,
          flex: 3,
          title: name,
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
      ],
    );
  }
}
