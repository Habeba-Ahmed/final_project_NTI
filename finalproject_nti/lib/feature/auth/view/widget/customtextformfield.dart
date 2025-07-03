import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixicon;
  final IconData? suffixicon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  const CustomTextFormField({
    super.key, 
    required this.controller, 
    required this.hintText, 
    this.prefixicon, 
    this.obscureText=false, 
    this.suffixicon, 
    this.validator,
    this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator:validator ,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixicon),
        suffixIcon: Icon(suffixicon),
        prefixIconColor: AppColor.authiconcolor,
        hintText: hintText,
        hintStyle: AppTextStyle.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: AppColor.fillcolor
      ),
    );
  }
}