import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_page/right_section.dart';
import 'package:hospital_management/core/common/components/table_cell_drop.dart';
import 'package:hospital_management/features/dash_board/presentations/bloc/dashboard_bloc.dart';
import 'package:hospital_management/gen/assets.gen.dart';

class DecentralizationSection extends StatelessWidget {
  const DecentralizationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return RightSection(
          sectionOnPressedSave: () {},
          title: '3. PHÂN QUYỀN',
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(context, state),
                _buildBodyTable(context, state),
                _buildTableSearch()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, DashboardState state) {
    return Row(
      children: [
        TableCellDrop(
          bgrColor: AppColor.c_D8F1FD,
          flex: 1,
          child: Checkbox(
            value: state.isAllowsMultiSelectDecentralizationRole,
            onChanged: (value) {
              context
                  .read<DashboardBloc>()
                  .add(const DashboardEvent.allowsMultiSelectDectRole());
            },
          ),
        ),
        const TableCellDrop(
          isHeader: true,
          bgrColor: AppColor.c_D8F1FD,
          flex: 3,
          title: 'Mã',
        ),
        const TableCellDrop(
          isHeader: true,
          bgrColor: AppColor.c_D8F1FD,
          flex: 10,
          title: 'Tên',
        ),
      ],
    );
  }

  Widget _buildTableSearch() {
    return Row(
      children: [
        const TableCellDrop(
          bgrColor: AppColor.c_FFFFFF,
          flex: 1,
          title: '',
        ),
        TableCellDrop(
          isHeader: true,
          bgrColor: AppColor.c_FFFFFF,
          flex: 3,
          child: Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(Assets.icons.searchIcon),
          ),
        ),
        TableCellDrop(
          isHeader: true,
          bgrColor: AppColor.c_FFFFFF,
          flex: 10,
          child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(Assets.icons.searchIcon)),
        ),
      ],
    );
  }

  Widget _buildBodyTable(BuildContext context, DashboardState state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.roleGroup?.screens.length ?? 0,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () =>
                  context.read<DashboardBloc>().add(ToggleExpandEvent(index)),
              child: _buildRow(
                context: context,
                backgroundColor: AppColor.c_F0FAFE,
                checkboxValue: state.isAllowsMultiSelectDecentralizationRole,
                checkboxOnChanged: (value) {},
                code: state.roleGroup!.screens[index].screenCode,
                name: state.roleGroup!.screens[index].screenName,
                padding: 10.0,
                isExpanded: state.isExpandedList[index],
              ),
            ),
            if (state.isExpandedList[index])
              Column(
                children: List.generate(1, (subIndex) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => context
                            .read<DashboardBloc>()
                            .add(ToggleSubExpandEvent(index, subIndex)),
                        child: _buildRow(
                          context: context,
                          backgroundColor: AppColor.c_FFFFFF,
                          checkboxValue:
                              state.isAllowsMultiSelectDecentralizationRole,
                          checkboxOnChanged: (value) {},
                          code: state
                              .roleGroup!.screens[index].screenSub!.screenCode,
                          name: state
                              .roleGroup!.screens[index].screenSub!.screenName,
                          padding: 20.0,
                          isExpanded: state.subLevelExpandedList[index]
                              [subIndex],
                        ),
                      ),
                      if (state.subLevelExpandedList[index][subIndex])
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: _buildRow(
                                context: context,
                                backgroundColor: AppColor.c_FFFFFF,
                                checkboxValue: state
                                    .isAllowsMultiSelectDecentralizationRole,
                                checkboxOnChanged: (value) {},
                                code: state.roleGroup!.screens[index].screenSub!
                                    .screenSubSub!.screenCode,
                                name: state.roleGroup!.screens[index].screenSub!
                                    .screenSubSub!.screenName,
                                padding: 30.0,
                                isExpanded:
                                    false, // Always false for the deepest level
                              ),
                            ),
                            for (int i = 0;
                                i <
                                    state.roleGroup!.screens[index].screenSub!
                                        .screenSubSub!.role.length;
                                i++)
                              _buildActionRow(
                                _getActionRowName(state
                                    .roleGroup!
                                    .screens[index]
                                    .screenSub!
                                    .screenSubSub!
                                    .role[i]),
                                padding: 30.0,
                              ),
                          ],
                        ),
                    ],
                  );
                }),
              ),
          ],
        );
      },
    );
  }

  String _getActionRowName(int roleValue) {
    switch (roleValue) {
      case 1:
        return 'Xem';
      case 2:
        return 'Thêm';
      case 3:
        return 'Xoá';
      default:
        return '';
    }
  }

  Widget _buildRow({
    required BuildContext context,
    required Color backgroundColor,
    required bool checkboxValue,
    required ValueChanged<bool?> checkboxOnChanged,
    required String code,
    required String name,
    required double padding,
    required bool isExpanded,
  }) {
    return Row(
      children: [
        TableCellDrop(
          bgrColor: backgroundColor,
          flex: 1,
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Checkbox(
            value: checkboxValue,
            onChanged: checkboxOnChanged,
          ),
        ),
        TableCellDrop(
          bgrColor: backgroundColor,
          flex: 3,
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            children: [
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
          flex: 10,
          title: name,
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
      ],
    );
  }

  Widget _buildActionRow(String actionTitle, {required double padding}) {
    return Row(
      children: [
        TableCellDrop(
          bgrColor: AppColor.c_FFFFFF,
          flex: 1,
          title: '',
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
        TableCellDrop(
          bgrColor: AppColor.c_FFFFFF,
          flex: 3,
          title: '',
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
        TableCellDrop(
          bgrColor: AppColor.c_FFFFFF,
          flex: 10,
          title: actionTitle,
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
      ],
    );
  }
}
