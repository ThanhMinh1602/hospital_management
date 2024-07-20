import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/core/common/button/app_button.dart';
import 'package:hospital_management/core/common/check_box/app_checkbox.dart';
import 'package:hospital_management/core/common/input/app_input.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_section.dart';
import 'package:hospital_management/gen/assets.gen.dart';

class RightPage extends StatelessWidget {
  const RightPage({super.key});

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildRightHeader(
                addOnPressed: () {},
                editOnPressed: () {},
                saveOnPressed: () {},
                cancelOnPressed: () {},
                nextOnPressed: () {},
              ),
              _buildRoleGroupInformationSection(),
              const SizedBox(height: 5.0),
              _buildUserSection(),
              const SizedBox(height: 5.0),
              _buildDecentralizationSection(),
            ],
          )),
    );
  }

  Widget _buildRoleGroupInformationSection() {
    return RightSection(
      padding: const EdgeInsets.all(8.0),
      sectionOnPressedSave: () {},
      title: '1. THÔNG TIN NHÓM QUYỀN',
      child: Column(children: [
        _buildCodeRoleItem(isUsed: false),
        const SizedBox(height: 8),
        __buildRoleNameItem(),
        const SizedBox(height: 8),
        _buildExplainItem(controller: TextEditingController()),
      ]),
    );
  }

  Widget _buildCodeRoleItem(
      {TextEditingController? controller, required bool isUsed}) {
    return Row(
      children: [
        _labelInputSection(label: "Mã"),
        const SizedBox(width: 17),
        AppInput(
          controller: controller,
          enabled: false,
          hintText: 'Mã nhóm quyền',
          maxWidth: 206,
        ),
        const SizedBox(width: 20),
        CustomCheckBox(
          label: 'Sử dụng',
          onChanged: (value) {},
          value: isUsed,
        ),
      ],
    );
  }

  Widget __buildRoleNameItem({TextEditingController? controller}) {
    return Row(
      children: [
        _labelInputSection(label: "Tên"),
        const SizedBox(width: 17),
        Expanded(
          child: AppInput(
            hintText: 'Tên nhóm quyền',
            controller: controller,
          ),
        ),
      ],
    );
  }

  Widget _buildExplainItem({required TextEditingController controller}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _labelInputSection(label: "Diễn giải"),
        const SizedBox(width: 17),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.c_E3E7EB),
                borderRadius: BorderRadius.circular(6.0)),
            child: EditableText(
              selectionColor: AppColor.c_006EA9.withOpacity(0.4),
              // selectionControls: ,
              controller: controller,
              focusNode: FocusNode(),
              style: AppStyle.tableRow,
              cursorColor: AppColor.c_2F80ED,
              maxLines: 5,
              backgroundCursorColor: AppColor.c_FFFFFF,
              keyboardType: TextInputType.multiline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _labelInputSection({required String label}) {
    return Container(
      alignment: Alignment.centerRight,
      width: 100,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: label, style: AppStyle.labelInputSection),
            const TextSpan(
                text: ' *',
                style: TextStyle(
                    color: AppColor.c_D84226, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildUserSection() {
    return RightSection(
      sectionOnPressedSave: () {},
      title: '2. NGƯỜI DÙNG',
      child: const Column(
        children: [],
      ),
    );
  }

  Widget _buildDecentralizationSection() {
    return RightSection(
      sectionOnPressedSave: () {},
      title: '3. PHÂN QUYỀN',
      child: const Column(
        children: [],
      ),
    );
  }

  Widget _buildRightHeader({
    required void Function() addOnPressed,
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
            title: 'Thêm',
            iconPath: Assets.icons.addIcon,
            onPressed: addOnPressed,
          ),
          const SizedBox(width: 5.0),
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
}
