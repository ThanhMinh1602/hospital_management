import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management/core/common/button/remove_button.dart';
import 'package:hospital_management/core/common/button/square_button.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
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
                        ? Color.fromARGB(255, 241, 253, 255)
                        : AppColor.c_F2F2F2,
                    title: 'Khoa Phòng',
                    onTap: () => context
                        .read<DashboardBloc>()
                        .add(const DashboardEvent.changeTableUser(0)),
                  ),
                  const SizedBox(width: 4.0),
                  _buildTabarItem(
                    backgroundColor: state.curentTableUser == 1
                        ? Color.fromARGB(255, 241, 253, 255)
                        : AppColor.c_F2F2F2,
                    title: 'Tài Khoản',
                    onTap: () => context
                        .read<DashboardBloc>()
                        .add(const DashboardEvent.changeTableUser(1)),
                  ),
                ],
              ),
              _buildHeaderUserSection(state),
              _buildTableUser(currentTable: state.curentTableUser)
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

  Widget _buildHeaderUserSection(DashboardState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 4.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 241, 253, 255),
      ),
      child: Row(
        children: [
          Text(state.curentTableUser == 0 ? 'Khoa Phòng' : 'Tài Khoản',
              style: AppStyle.tabTitle),
          const SizedBox(width: 8.0),
          DropdownButtonFormField(
            decoration: InputDecoration(
              constraints:
                  const BoxConstraints(maxWidth: 202.0, maxHeight: 40.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide:
                    const BorderSide(color: AppColor.c_979797, width: 0.5),
              ),
            ),
            value: 'HCQT',
            hint: const Text('Chọn phòng khoa'),
            items: const [
              DropdownMenuItem(
                value: 'HCQT',
                child: Text('Hành chính quản trị'),
              ),
              DropdownMenuItem(
                value: 'HCTT',
                child: Text('Hành chính quản trị'),
              ),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(width: 15.0),
          AppSquareButton(
            iconPath: Assets.icons.dropIcon,
          ),
          const SizedBox(width: 7.0),
          const RemoveButton(),
        ],
      ),
    );
  }

  Widget _buildTableUser({required int currentTable}) {
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
        _buildRowTableUser(),
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

  TableRow _buildRowTableUser() {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColor.c_FFFFFF,
      ),
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        const CustomTableCell(text: 'HCQT'),
        const CustomTableCell(
          text: 'Hành chính quản trị',
        ),
        _buildDeleteButton(),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child:
            Center(child: AppSquareButton(iconPath: Assets.icons.deleteIcon)));
  }
}
