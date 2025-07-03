import 'package:finalproject_nti/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const CustomElevatedButton({
    super.key, 
    required this.buttonText, 
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width : double.infinity,
      height : 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.secoundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: AppColor.backgroundColor),
        ),
      ),
    );
  }
}