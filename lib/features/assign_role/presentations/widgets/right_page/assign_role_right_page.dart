import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_management/core/common/button/app_button.dart';
import 'package:hospital_management/core/common/components/table_cell_drop.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
import 'package:hospital_management/features/assign_role/presentations/bloc/assign_roles_bloc.dart';
import 'package:hospital_management/gen/assets.gen.dart';

class AssignRoleRightPage extends StatelessWidget {
  const AssignRoleRightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding:
              const EdgeInsets.symmetric(horizontal: 10.0).copyWith(top: 14.5),
          decoration: const BoxDecoration(
              color: AppColor.c_F8FAFC,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildRightHeader(
                  cancelOnPressed: () {},
                  editOnPressed: () {},
                  nextOnPressed: () {},
                  saveOnPressed: () {},
                ),
                _buildTableHeader(),
                _buildTableBody(context),
              ],
            ),
          )),
    );
  }

  Widget _buildRightHeader({
    required void Function() editOnPressed,
    required void Function() saveOnPressed,
    required void Function() cancelOnPressed,
    required void Function() nextOnPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton(
            title: 'Sửa',
            iconPath: Assets.icons.editIcon,
            onPressed: editOnPressed,
          ),
          const SizedBox(width: 5.0),
          AppButton(
            title: 'Lưu',
            iconPath: Assets.icons.saveIcon,
            onPressed: saveOnPressed,
          ),
          const SizedBox(width: 5.0),
          AppButton(
            title: 'Huỷ',
            iconPath: Assets.icons.cancelIcon,
            backgroundColor: AppColor.c_FFFFFF,
            foregroundColor: AppColor.c_006EA9,
            onPressed: cancelOnPressed,
          ),
          const SizedBox(width: 5.0),
          GestureDetector(
            onTap: nextOnPressed,
            child: SvgPicture.asset(Assets.icons.nextIcon),
          )
        ],
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
          title: 'Mã nhóm quyền',
        ),
        TableCellDrop(
          isHeader: true,
          bgrColor: AppColor.c_D8F1FD,
          flex: 4,
          title: 'Tên nhóm quyền',
        ),
        TableCellDrop(
          isHeader: true,
          bgrColor: AppColor.c_D8F1FD,
          flex: 4,
          title: 'Quyền',
        ),
        TableCellDrop(
          isHeader: true,
          bgrColor: AppColor.c_D8F1FD,
          flex: 1,
          title: '',
        ),
      ],
    );
  }

  Widget _buildTableBody(BuildContext context) {
    return BlocBuilder<AssignRolesBloc, AssignRolesState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5, // Thay đổi theo số lượng phần tử bạn có
          itemBuilder: (context, index) {
            final isExpanded = state.rightIsExpandedList[index];

            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context
                        .read<AssignRolesBloc>()
                        .add(AssignRolesEvent.toggleRightExpand(index));
                  },
                  child: _buildRow(
                    context: context,
                    backgroundColor: AppColor.c_F0FAFE,
                    code: 'Admin', // Cập nhật giá trị thực tế
                    name: 'Quản trị hệ thống', // Cập nhật giá trị thực tế
                    role: 'Toàn quyền', // Cập nhật giá trị thực tế
                    padding: 10.0,
                    isExpanded: isExpanded,
                    hasArrow: true,
                  ),
                ),
                if (isExpanded) ...[
                  _buildActionRow('Xem', padding: 30.0),
                  _buildActionRow('Thêm', padding: 30.0),
                  _buildActionRow('Xoá', padding: 30.0),
                ]
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildRow({
    required BuildContext context,
    required Color backgroundColor,
    required String code,
    required String name,
    required String role,
    required double padding,
    required bool isExpanded,
    required bool hasArrow,
  }) {
    return Row(
      children: [
        TableCellDrop(
          bgrColor: backgroundColor,
          flex: 2,
          title: code,
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
        TableCellDrop(
          bgrColor: backgroundColor,
          flex: 4,
          title: name,
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
        TableCellDrop(
          bgrColor: backgroundColor,
          flex: 4,
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
                role,
                style: AppStyle.tableRow,
              ),
            ],
          ),
        ),
        TableCellDrop(
          bgrColor: backgroundColor,
          flex: 1,
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }

  Widget _buildActionRow(String actionTitle, {required double padding}) {
    return Row(
      children: [
        TableCellDrop(
          bgrColor: AppColor.c_FFFFFF,
          flex: 2,
          title: '',
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
        TableCellDrop(
          bgrColor: AppColor.c_FFFFFF,
          flex: 4,
          title: '',
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
        TableCellDrop(
          bgrColor: AppColor.c_FFFFFF,
          flex: 4,
          title: actionTitle,
          padding: EdgeInsets.symmetric(horizontal: padding),
        ),
        TableCellDrop(
          bgrColor: AppColor.c_FFFFFF,
          flex: 1,
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
