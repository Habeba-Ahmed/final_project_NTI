import 'package:flutter/material.dart';

import '../../../../core/constant/style.dart';

class CustomHeaderText extends StatelessWidget {
  final String headrtText;
  const CustomHeaderText({super.key, required this.headrtText});

  @override
  Widget build(BuildContext context) {
    return Text(headrtText, style: AppTextStyle.headerText);
  }
}