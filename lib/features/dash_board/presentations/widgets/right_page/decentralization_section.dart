import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_page/right_section.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/table_cell_drop.dart';
import 'package:hospital_management/features/dash_board/presentations/bloc/dashboard_bloc.dart';

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
                _buildHeader(),
                _buildBodyTable(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        TableCellDrop(
          bgrColor: AppColor.c_D8F1FD,
          flex: 1,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
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

  Widget _buildBodyTable(BuildContext context, DashboardState state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.roleGroupSimples.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () =>
                  context.read<DashboardBloc>().add(ToggleExpandEvent(index)),
              child: _buildRow(
                context: context,
                backgroundColor: AppColor.c_F0FAFE,
                checkboxValue: true,
                checkboxOnChanged: (value) {},
                code: 'E01',
                name: 'Nội trú',
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
                          checkboxValue: true,
                          checkboxOnChanged: (value) {},
                          code: 'E01L00001',
                          name: 'Hồ sơ điều trị',
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
                                checkboxValue: true,
                                checkboxOnChanged: (value) {},
                                code: 'E01L00001.1',
                                name: 'Hồ sơ bác sĩ',
                                padding: 30.0,
                                isExpanded:
                                    false, // Always false for the deepest level
                              ),
                            ),
                            _buildActionRow('Xem', padding: 30.0),
                            _buildActionRow('Thêm', padding: 30.0),
                            _buildActionRow('Xoá', padding: 30.0),
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
