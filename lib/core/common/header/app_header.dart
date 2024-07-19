import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      decoration: BoxDecoration(
        color: AppColor.c_FFFFFF,
        boxShadow: [
          BoxShadow(
              blurRadius: 16,
              spreadRadius: -6,
              offset: const Offset(0, 8),
              color: AppColor.c_18274B.withOpacity(0.2)),
        ],
      ),
      child: Row(
        children: [
          _buildButtonMenu(),
          const SizedBox(width: 140.0),
          _buildTitle(),
          const Spacer(),
          _buildSerchField(),
          const SizedBox(width: 15.0),
          _buildSelectDepartment(),
          _buildDocterName(doctorName: 'BS. Trần Thanh Sơn')
        ],
      ),
    );
  }

  AppInput _buildSerchField() {
    return AppInput(
      hintText: "Nhập tên/ Mã màn hình",
      iconPath: Assets.icons.searchIcon,
    );
  }

  Text _buildTitle() {
    return const Text('NHÓM QUYỀN',
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
            height: 45.0,
            color: AppColor.c_000000));
  }

  Widget _buildButtonMenu({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
    );
  }

  Widget _buildDocterName({required String doctorName}) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          SvgPicture.asset(Assets.icons.bellIcon),
          const SizedBox(width: 10.0),
          SvgPicture.asset(Assets.icons.personIcon),
          const SizedBox(width: 10.0),
          Text(doctorName, style: AppStyle.doctorName)
        ],
      ),
    );
  }

  Widget _buildSelectDepartment() {
    return Container(
      height: 45.0,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: AppColor.c_D5E6FB, borderRadius: BorderRadius.circular(4.0)),
      child: Text('Bệnh viện A - Phòng Công Nghệ Thông Tin',
          style: AppStyle.selectDepartment),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 90);
}
