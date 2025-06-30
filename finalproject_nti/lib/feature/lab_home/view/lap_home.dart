import 'package:finalproject_nti/feature/allproudect/view/allproudect.dart';
import 'package:finalproject_nti/feature/lab_home/cubit/lap_cubit.dart';
import 'package:finalproject_nti/feature/lab_home/cubit/lap_state.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/custombutton.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customfailedstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customloadingstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customsubtitle.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customsuccessstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customtopbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabHome extends StatelessWidget {
  const LabHome({super.key});
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const SizedBox(height : 50),
            
            CustomTopBar(),

            const SizedBox(height : 30),
            
            Text(
              'Explore our Diverse Range of Laptops',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height : 5,),
            Text(
              'Find Your Perfect Laptop Match',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height : 30),

            CustomButton(
              text: 'Shop Now',
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AllProudect();
                  },
                ),
              );
              }),

            Container(
              height : MediaQuery.of(context).size.height * 0.5,
              width : double.infinity,
              margin: const EdgeInsets.only(top : 20),
              color: Colors.black,
              child: BlocProvider(
                create: (context) => LapCubit()..fetchLabDataCubie(),
                child: BlocBuilder<LapCubit, LapState>(
                  builder: (context, state) {
                    if (state is LapLoadingState) {
                      return CustomLoadingState();
                    } else if (state is LapSuccessState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomSubTitle(title: 'Products',color: Colors.white,),
                          const SizedBox(height : 15),
                          CustomSuccessState(state: state.labs),
                        ],
                      );
                    } else {
                      return CustomFailedState();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
