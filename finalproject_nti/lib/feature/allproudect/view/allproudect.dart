import 'package:finalproject_nti/feature/allproudect/view/widget/customlapsuccessstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject_nti/feature/allproudect/view/widget/customrowpages.dart';
import 'package:finalproject_nti/feature/lab_home/cubit/lap_cubit.dart';
import 'package:finalproject_nti/feature/lab_home/cubit/lap_state.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customfailedstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customloadingstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customsubtitle.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customtopbar.dart';

class AllProudect extends StatelessWidget {
  final List<dynamic>? sortedLabs;

  const AllProudect({super.key, this.sortedLabs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height : 50),
            const CustomTopBar(),
            const Divider(color: Colors.black),
            const SizedBox(height : 20),
            const CustomRowPages(title: ' All Products'),
            const SizedBox(height : 20),
            const CustomSubTitle(title: 'All Products'),
            const SizedBox(height : 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: BlocProvider(
                  create: (context) => LapCubit()..fetchLabDataCubie(),
                  child: BlocBuilder<LapCubit, LapState>(
                    builder: (context, state) {
                      if (state is LapLoadingState) {
                        return const CustomLoadingState();
                      } else if (state is LapSuccessState) {
                        return CustomLapSuccessState(state: state, sortedlaps: sortedLabs ?? state.labs,);
                      } else {
                        return const CustomFailedState();
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
