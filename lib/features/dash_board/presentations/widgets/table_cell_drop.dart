import 'package:flutter/material.dart';
import 'package:hospital_management/core/constants/app_style.dart';

class TableCellDrop extends StatelessWidget {
  final int flex;
  final Color bgrColor;
  final Widget? child;
  final String? title;
  const TableCellDrop(
      {super.key,
      required this.flex,
      required this.bgrColor,
      this.child,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 50.0,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          color: bgrColor,
        ),
        child: child ?? Text(title ?? '', style: AppStyle.tableHeader),
      ),
    );
  }
}
