import 'package:flutter/material.dart';

import '../../../../core/constant/style.dart';

class CustomAuthBottomText extends StatelessWidget {
  final String normalText;
  final String actionText;
  final void Function()? onPressed;
  const CustomAuthBottomText({
    super.key, 
    required this.normalText, 
    required this.actionText, 
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(normalText,style: AppTextStyle.createorhaveAccountText,),
        TextButton(
          onPressed: onPressed, 
          child: Text(actionText,style: AppTextStyle.signuporloginText,))
      ],
    );
  }
}