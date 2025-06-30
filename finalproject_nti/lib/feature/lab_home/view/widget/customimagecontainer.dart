import 'package:finalproject_nti/feature/favorite/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomImageContainer extends StatelessWidget {
  final String image;
  final String id;
  final bool isCart;
  const CustomImageContainer({super.key, required this.image, required this.id, this.isCart=false});

  @override
  Widget build(BuildContext context) {
    return Container(
          width : double.infinity,
          height : 200,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF5CBA7),
                Color(0xFFFAD7A0),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    image ,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              isCart?SizedBox():
              Positioned(
                top : 10,
                right : 10,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () {
                    context.read<FavCubit>().addFavorite(id);
                  },
                ),
              ),
            ],
          ),
        );
                          
  }
}