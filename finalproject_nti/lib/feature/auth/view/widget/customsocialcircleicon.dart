import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class CustomSocialCircleIcon extends StatelessWidget {
  final void Function()? onTap;
  final Widget widget;
  const CustomSocialCircleIcon({super.key, this.onTap, required this.widget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width : 54,
        height : 54,
        decoration: BoxDecoration(
          color: AppColor.ligthPinkColor,
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.secoundColor)
        ),
        child: Center(child: widget),
      ),
    );
  }
}