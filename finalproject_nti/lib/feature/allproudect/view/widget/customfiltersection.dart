import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject_nti/feature/allproudect/view/allproudect.dart';
import 'package:finalproject_nti/feature/filter&sort/view/filter&sort.dart';
import 'package:finalproject_nti/feature/lab_home/cubit/lap_cubit.dart';

class CustomFilterSection extends StatelessWidget {
  final dynamic state; 

  const CustomFilterSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selectedSort = await showModalBottomSheet<String>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top : Radius.circular(20)),
          ),
          builder: (context) => FilterSortPanel(
            count: state.labs.length,
            selectedSort: 'Newest', 
          ),
        );

        if (selectedSort != null) {
          final sortedLabs = [...state.labs];

          switch (selectedSort) {
            case 'Name A-Z':
              sortedLabs.sort((a, b) => a['name'].compareTo(b['name']));
              break;
            case 'Name Z-A':
              sortedLabs.sort((a, b) => b['name'].compareTo(a['name']));
              break;
            case 'Price (low to high)':
              sortedLabs.sort((a, b) => a['price'].compareTo(b['price']));
              break;
            case 'Price (high to low)':
              sortedLabs.sort((a, b) => b['price'].compareTo(a['price']));
              break;
            default:
              break;
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: BlocProvider.of<LapCubit>(context),
                child: AllProudect(sortedLabs: sortedLabs),
              ),
            ),
          );
        }
      },
      child: const Text(
        'Filter & Sort',
        style: TextStyle(
          fontSize: 25,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
