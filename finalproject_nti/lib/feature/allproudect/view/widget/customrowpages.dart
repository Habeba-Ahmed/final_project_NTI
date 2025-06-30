import 'package:finalproject_nti/feature/lab_home/view/lap_home.dart';
import 'package:flutter/material.dart';

class CustomRowPages extends StatelessWidget {
  final String title;
  const CustomRowPages({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            InkWell(
              onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LabHome()), 
                (route) => false,
              ),
              child: Text('Home ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black45,),

            Text(title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        );
  }
}