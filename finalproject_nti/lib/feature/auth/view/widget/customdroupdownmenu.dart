import 'package:finalproject_nti/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/style.dart';

class CustomDroupDownMenu extends StatelessWidget {
  final TextEditingController genderController;
  final String? Function(String?)? validator;
  const CustomDroupDownMenu({super.key, required this.genderController, this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: null,
      decoration: InputDecoration(
        hintStyle: AppTextStyle.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: AppColor.fillcolor,
        prefixIcon: Icon(Icons.transgender_outlined),
        hintText: 'Gender',
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
      ),
      items: ['male', 'female'].map((gender) {
        return DropdownMenuItem(value: gender, child: Text(gender));
      }).toList(),
      onChanged: (val) {
        genderController.text = val!;
      },
      validator: validator
    );
  }
}