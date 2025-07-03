import 'package:finalproject_nti/core/constant/color.dart';
import 'package:flutter/material.dart';

class AppTextStyle{
  static final TextStyle headerText=TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: AppColor.blackColor,
            fontFamily: 'Montserrat',
          );

  static final TextStyle hintText=TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColor.hintcolor,
            fontFamily: 'Montserrat',
          );
          
  static final TextStyle orContinueText=TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColor.gray500Color,
            fontFamily: 'Montserrat',
          );

  static final TextStyle createorhaveAccountText=TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.gray500Color,
            fontFamily: 'Montserrat',
          );


  static final TextStyle signuporloginText=TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColor.secoundColor,
            fontFamily: 'Montserrat',
            decoration: TextDecoration.underline,
            decorationColor: AppColor.secoundColor
          );

  static final TextStyle agreementText=TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColor.hintcolor,
            fontFamily: 'Montserrat',
          );


}