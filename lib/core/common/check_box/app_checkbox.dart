import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management/core/constants/app_color.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          activeColor: AppColor.c_FFFFFF,
          checkColor: Colors.black,
        ),
        Text(
          label,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w600,
            fontSize: 16.8,
            color: AppColor.c_323F4B,
          ),
        )
      ],
    );
  }
}
