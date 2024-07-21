import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/gen/assets.gen.dart';

class RemoveButton extends StatelessWidget {
  final void Function()? onTap;
  const RemoveButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 75.71,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.71),
          border: Border.all(
            color: AppColor.c_D84226,
            width: 1.43,
          ),
        ),
        child: SvgPicture.asset(Assets.icons.removeIcon),
      ),
    );
  }
}
