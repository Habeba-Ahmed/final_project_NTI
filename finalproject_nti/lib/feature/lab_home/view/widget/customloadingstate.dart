import 'package:flutter/material.dart';

class CustomLoadingState extends StatelessWidget {
  const CustomLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}