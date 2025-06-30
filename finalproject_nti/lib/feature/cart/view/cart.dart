import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalproject_nti/feature/cart/cubit/cubit/cart_cubit.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customfailedstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customloadingstate.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customimagecontainer.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const CustomLoadingState();
            } else if (state is CartSuccessGetState) {
              return Column(
                children: [
                  const SizedBox(height : 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cart (${state.cartList.length} Items)',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.cartList.length,
                      itemBuilder: (context, index) {
                        final lab = state.cartList[index];
                        final quantity = lab['quantity'] ; 

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: SizedBox(
                              width : 100,
                              height : 60,
                              child: CustomImageContainer(
                                image: lab['image'],
                                id: lab['_id'],
                                isCart: true,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lab['name'] ,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height : 5),
                                Text(
                                  '\$${lab['price'] }',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height : 5),
                                SafeArea(
                                  child: Row(
                                    children: [
                                      SafeArea(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all()
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.remove),
                                                onPressed: () {
                                                },
                                              ),
                                              Text('$quantity'),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed: () {
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text('\$${quantity*lab['price'] }')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                              },
                              icon: const Icon(Icons.delete_outline_outlined),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const CustomFailedState();
            }
          },
        ),
      ),
    );
  }
}
