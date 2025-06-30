import 'package:finalproject_nti/feature/cart/cubit/cubit/cart_cubit.dart';
import 'package:finalproject_nti/feature/cart/view/cart.dart';
import 'package:finalproject_nti/feature/favorite/cubit/fav_cubit.dart';
import 'package:finalproject_nti/feature/favorite/view/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.laptop_chromebook, size: 20, color: Colors.blueGrey[800]),
            const SizedBox(width : 10),
            Text(
              'Laptops',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                context.read<FavCubit>().getFavorites();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Favorite()),
                );
              },
              icon: Icon(Icons.favorite_border, size: 30, color: Colors.blueGrey[800]),
            ),
            IconButton(
              onPressed: () {
                context.read<CartCubit>().getCart();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: Icon(Icons.card_travel, size: 30, color: Colors.blueGrey[800]),
            ),
          ],
        )
      ],
    );
  }
}
