import 'package:finalproject_nti/feature/auth/view/widget/customauthbottomtext.dart';
import 'package:finalproject_nti/feature/auth/view/widget/customsocialcircleicon.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/constant/style.dart';

class CustomAuthSocialSection extends StatelessWidget {
  final String normalText;
  final String actionText;
  final void Function() onPressed;
  final double width;
  final double hight;
  const CustomAuthSocialSection({
    super.key, 
    required this.normalText, 
    required this.actionText,
    required this.onPressed, 
    required this.width, 
    required this.hight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width : width,
      height : hight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('- OR Continue with -',style: AppTextStyle.orContinueText,),
          SizedBox(height : 10,),
          Center(
            child: Row(
              spacing : 10 ,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                CustomSocialCircleIcon(
                  widget: SizedBox(
                    height : 24,
                    width : 24,
                    child: Image.asset(AppImages.google,fit: BoxFit.contain,))),
                
                CustomSocialCircleIcon(
                  widget: Icon(Icons.apple,size: 25,color: AppColor.blackColor,)),
                
                CustomSocialCircleIcon(
                  widget: Icon(Icons.facebook_rounded,size: 25,color:  Color(0xff3D4DA6))),
                
              ],
            ),
          ),

          CustomAuthBottomText(
            normalText: normalText, 
            actionText: actionText, 
            onPressed: onPressed)
        ],
      ),
    );
            
  }
}