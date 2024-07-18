import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management/core/common/input/app_input.dart';
import 'package:hospital_management/gen/assets.gen.dart';

import '../../constants/app_color.dart';
import '../../constants/app_style.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
      width: double.infinity,
      height: 90,
      color: AppColor.c_FFFFFF,
      child: Row(
        children: [
          Container(
            width: 56.0,
            height: 56.0,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: AppColor.c_D5E6FB,
                width: 0.5,
              ),
            ),
            child: SvgPicture.asset(Assets.icons.menuIcon),
          ),
          const SizedBox(width: 140.0),
          Text('NHÓM QUYỀN', style: AppStyle.headerTitle),
          AppInput(
            hintText: "Nhập tên/ Mã màn hình",
            iconPath: Assets.icons.searchIcon,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 90);
}
