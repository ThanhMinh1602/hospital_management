import 'package:flutter/material.dart';
import 'package:hospital_management/core/common/button/app_button.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
import 'package:hospital_management/gen/assets.gen.dart';

class RightSection extends StatelessWidget {
  final String title;
  final Widget child;
  final void Function()? sectionOnPressedSave;
  const RightSection({
    super.key,
    required this.title,
    required this.child,
    this.sectionOnPressedSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          width: double.infinity,
          height: 50.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),
            color: AppColor.c_B8E5FA,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppStyle.sectionRightHeader),
              AppButton(
                onPressed: sectionOnPressedSave,
                title: 'Lưu',
                iconPath: Assets.icons.saveIcon,
                boderColor: Colors.transparent,
                backgroundColor: AppColor.c_006EA9,
              )
            ],
          ),
        ),
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColor.c_FFFFFF,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(5.0)),
          ),
          child: child,
        )
      ],
    );
    ;
  }
}
