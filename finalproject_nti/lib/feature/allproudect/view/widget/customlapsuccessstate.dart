import 'package:finalproject_nti/feature/allproudect/view/widget/customfiltersection.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customsuccessstate.dart';
import 'package:flutter/material.dart';

class CustomLapSuccessState extends StatelessWidget {
  final state;
  final  sortedlaps;
  const CustomLapSuccessState({super.key, required this.state,required this.sortedlaps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${state.labs.length} Products',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            CustomFilterSection(state: state)
          ],
        ),
        const SizedBox(height : 20),
        CustomSuccessState(
          state: sortedlaps,
          isHome: false,
        ),
      ],
    );
  }
}