import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management/core/constants/app_color.dart';
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
          bgrColor: AppColor.c_D8F1FD,
          flex: 3,
          title: 'Mã',
        ),
        const TableCellDrop(
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
              onTap: () {
                context.read<DashboardBloc>().add(ToggleExpandEvent(index));
              },
              child: Row(
                children: [
                  TableCellDrop(
                    bgrColor: AppColor.c_D8F1FD,
                    flex: 1,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  TableCellDrop(
                    bgrColor: AppColor.c_D8F1FD,
                    flex: 3,
                    title: 'Mã ${index + 1}',
                  ),
                  TableCellDrop(
                    bgrColor: AppColor.c_D8F1FD,
                    flex: 10,
                    title: 'Tên ${index + 1}',
                  ),
                ],
              ),
            ),
            if (state.isExpandedList[index]) ...[
              Column(
                children: List.generate(1, (subIndex) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<DashboardBloc>()
                              .add(ToggleSubExpandEvent(index, subIndex));
                        },
                        child: Row(
                          children: [
                            TableCellDrop(
                              bgrColor: AppColor.c_FFFFFF,
                              flex: 1,
                              child: Checkbox(
                                value: true,
                                onChanged: (value) {},
                              ),
                            ),
                            TableCellDrop(
                              bgrColor: AppColor.c_FFFFFF,
                              flex: 3,
                              title: '1.${index + 1}',
                            ),
                            TableCellDrop(
                              bgrColor: AppColor.c_FFFFFF,
                              flex: 10,
                              title: 'Tên 1.${index + 1}',
                            ),
                          ],
                        ),
                      ),
                      if (state.subLevelExpandedList[index][subIndex]) ...[
                        Column(
                          children: List.generate(1, (subSubIndex) {
                            return GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  TableCellDrop(
                                    bgrColor: AppColor.c_FFFFFF,
                                    flex: 1,
                                    child: Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  TableCellDrop(
                                    bgrColor: AppColor.c_FFFFFF,
                                    flex: 3,
                                    title: '1.${index + 1}.${subSubIndex + 1}',
                                  ),
                                  TableCellDrop(
                                    bgrColor: AppColor.c_FFFFFF,
                                    flex: 10,
                                    title:
                                        'Tên 1.${index + 1}.${subSubIndex + 1}',
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    ],
                  );
                }),
              ),
            ],
          ],
        );
      },
    );
  }
}
