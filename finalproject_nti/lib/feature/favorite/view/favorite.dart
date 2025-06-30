import 'package:finalproject_nti/feature/allproudect/view/widget/customrowpages.dart';
import 'package:finalproject_nti/feature/favorite/cubit/fav_cubit.dart';
import 'package:finalproject_nti/feature/favorite/cubit/fav_state.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customfailedstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customloadingstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customsuccessstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customtopbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavCubit>().getFavorites();


    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height : 50),
            const CustomTopBar(),
            const Divider(color: Colors.black),
            const SizedBox(height : 20),
            const CustomRowPages(title: 'Favorite'),
            const SizedBox(height : 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: BlocBuilder<FavCubit, FavState>(
                  builder: (context, state) {
                    if (state is FavLoadingState ||state is FavLoadingDeleteState  ) {
                      return const CustomLoadingState();
                    } else if (state is FavSuccessGetState) {
                      // final favList = state.favList;
                      // print('Iiiiiiiiiiiiiiiiiiiis favorited: ${favList}');
                      // print('Is favorited: ${favList.contains('_id'=='64666d3a91c71d884185b774')}');
                      return CustomSuccessState(
                        state: state.favList,
                        isHome: false,
                      );
                    } else {
                      return const CustomFailedState();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
