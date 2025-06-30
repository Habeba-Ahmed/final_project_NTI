import 'package:flutter/material.dart';

class CustomDroupDownMenu extends StatelessWidget {
  final TextEditingController genderController;
  final String? Function(String?)? validator;
  const CustomDroupDownMenu({super.key, required this.genderController, this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: null,
      decoration: const InputDecoration(
        hintText: 'Gender',
        border: OutlineInputBorder(),
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