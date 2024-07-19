import 'package:flutter/material.dart';
import 'package:hospital_management/core/common/check_box/app_checkbox.dart';
import 'package:hospital_management/core/constants/app_color.dart';

class RightPage extends StatelessWidget {
  const RightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.c_03053D,
        ),
        child: CustomCheckBox(
          label: 'Chọn',
          onChanged: (value) {
            print(value);
          },
          value: false,
        ),
      ),
    );
  }
}
