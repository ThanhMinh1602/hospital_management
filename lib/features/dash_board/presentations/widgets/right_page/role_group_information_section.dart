import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management/core/common/check_box/app_checkbox.dart';
import 'package:hospital_management/core/common/input/app_input.dart';
import 'package:hospital_management/core/constants/app_color.dart';
import 'package:hospital_management/core/constants/app_style.dart';
import 'package:hospital_management/features/dash_board/presentations/bloc/dashboard_bloc.dart';
import 'package:hospital_management/features/dash_board/presentations/widgets/right_page/right_section.dart';

class RoleGroupInformationSection extends StatefulWidget {
  const RoleGroupInformationSection({super.key});

  @override
  State<RoleGroupInformationSection> createState() =>
      _RoleGroupInformationSectionState();
}

class _RoleGroupInformationSectionState
    extends State<RoleGroupInformationSection> {
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state.roleGroup != null) {
          _codeController.text = state.roleGroup!.roleCode;
          _nameController.text = state.roleGroup!.roleName;
          _descriptionController.text = state.roleGroup!.description;
        }
        return RightSection(
          padding: const EdgeInsets.all(8.0),
          sectionOnPressedSave: () {},
          title: '1. THÔNG TIN NHÓM QUYỀN',
          child: Column(children: [
            _buildCodeRoleItem(
              isUsed: state.roleGroup?.isUse ?? 1,
              controller: _codeController,
            ),
            const SizedBox(
              height: 8,
            ),
            _buildRoleNameItem(controller: _nameController),
            const SizedBox(height: 8),
            _buildExplainItem(controller: _descriptionController),
          ]),
        );
      },
    );
  }

  Widget _buildCodeRoleItem(
      {TextEditingController? controller, required int isUsed}) {
    return Row(
      children: [
        _labelInputSection(label: "Mã"),
        const SizedBox(width: 17),
        AppInput(
          controller: controller,
          enabled: false,
          hintText: 'Mã nhóm quyền',
          maxWidth: 206,
        ),
        const SizedBox(width: 20),
        CustomCheckBox(
          label: 'Sử dụng',
          onChanged: (value) {},
          value: isUsed == 0 ? false : true,
        ),
      ],
    );
  }

  Widget _buildRoleNameItem({TextEditingController? controller}) {
    return Row(
      children: [
        _labelInputSection(label: "Tên"),
        const SizedBox(width: 17),
        Expanded(
          child: AppInput(
            hintText: 'Tên nhóm quyền',
            controller: controller,
          ),
        ),
      ],
    );
  }

  Widget _buildExplainItem({required TextEditingController controller}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _labelInputSection(label: "Diễn giải"),
        const SizedBox(width: 17),
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.c_E3E7EB),
                borderRadius: BorderRadius.circular(6.0)),
            child: EditableText(
              selectionColor: AppColor.c_006EA9.withOpacity(0.4),
              controller: controller,
              focusNode: FocusNode(),
              style: AppStyle.tableRow,
              cursorColor: AppColor.c_2F80ED,
              maxLines: 5,
              backgroundCursorColor: AppColor.c_FFFFFF,
              keyboardType: TextInputType.multiline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _labelInputSection({required String label}) {
    return Container(
      alignment: Alignment.centerRight,
      width: 100,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: label, style: AppStyle.labelInputSection),
            const TextSpan(
                text: ' *',
                style: TextStyle(
                    color: AppColor.c_D84226, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
