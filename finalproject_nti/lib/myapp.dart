import 'package:finalproject_nti/feature/auth/cubit/cubit/auth_cubit.dart';
import 'package:finalproject_nti/feature/auth/view/screens/signup.dart';
import 'package:finalproject_nti/feature/cart/cubit/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject_nti/feature/favorite/cubit/fav_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SignUp(),
      ),
    );
  }
}
