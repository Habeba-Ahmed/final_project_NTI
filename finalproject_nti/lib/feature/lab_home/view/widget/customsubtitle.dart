import 'package:flutter/material.dart';

class CustomSubTitle extends StatelessWidget {
  final String title;
  final Color color;
  const CustomSubTitle({super.key, required this.title, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color:color,
        ),
      ),
    );
  }
}