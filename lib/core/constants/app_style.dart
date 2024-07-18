import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management/core/constants/app_color.dart';

class AppStyle {
  AppStyle._();
  static TextStyle headerTitle = GoogleFonts.nunito(
      fontWeight: FontWeight.w700,
      fontSize: 30.0,
      height: 45.0,
      color: AppColor.c_000000);
  static TextStyle inputText = GoogleFonts.nunito(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: AppColor.c_939291,
  );
}
