import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/core/common/button/app_button.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/features/dash_board/presentations/bloc/dashboard_bloc.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_page/decentralization_section.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_page/role_group_information_section.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_page/user_section.dart';
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
          child: SingleChildScrollView(
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
                const RoleGroupInformationSection(),
                const SizedBox(height: 5.0),
                const UserSection(),
                const SizedBox(height: 5.0),
                const DecentralizationSection(),
              ],
            ),
          )),
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
