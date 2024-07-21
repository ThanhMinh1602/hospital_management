import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_management/core/common/button/app_button.dart';
import 'package:hospital_management/core/constants/app_color.dart';
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
}
