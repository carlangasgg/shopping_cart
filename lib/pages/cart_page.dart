import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/pages/bloc/ecommerce_bloc.dart';
import 'package:shopping_cart/widgets/app_colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<EcommerceBloc, EcommerceState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.cart.length,
            itemBuilder: (context, index) {
              if (state.cart.isEmpty) {
                return const SizedBox.shrink();
              }
              final product = state.cart[index];
              return ListTile(
                leading: Icon(Icons.check_box),
                title: Row(
                  children: [
                    Image.network(
                      product.imageUrl,
                      width: size.width * .2,
                      height: size.height * .1,
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: Column(
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(fontSize: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$ ${product.price}"),
                              IconButton(
                                onPressed: () {
                                  context.read<EcommerceBloc>().add(
                                        RemoveToCartEvent(
                                          product: product,
                                        ),
                                      );
                                },
                                icon: Icon(Icons.remove,
                                    color: AppColors.greyBackground),
                              ),
                              Text(product.quantity.toString()),
                              IconButton(
                                onPressed: () {
                                  context.read<EcommerceBloc>().add(
                                        AddToCartEvent(
                                          product: product,
                                        ),
                                      );
                                },
                                icon: Icon(Icons.add,
                                    color: AppColors.greyBackground),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // leading: Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Icon(Icons.check_box),
                //     Container(
                //       child: Image.network(product.imageUrl),
                //     ),
                //     Column(
                //       children: [
                //         SizedBox(
                //           child: Text(
                //             product.name,
                //             style: TextStyle(fontSize: 10),
                //           ),
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           //crossAxisAlignment: CrossAxisAlignment.baseline,
                //           children: [
                //             SizedBox(
                //               child: Text(
                //                 product.price.toString(),
                //                 //textAlign: TextAlign.start,
                //                 style: TextStyle(fontSize: 10),
                //               ),
                //             ),
                //             IconButton(
                //               onPressed: () {},
                //               icon: Icon(Icons.add,
                //                   color: AppColors.greyBackground),
                //             ),
                //             Text(product.quantity.toString()),
                //             IconButton(
                //               onPressed: () {},
                //               icon: Icon(Icons.remove,
                //                   color: AppColors.greyBackground),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              );
            },
          );
        },
      ),
    );
    //
    // children: [
    // CartSearch(),
    // CartBody(),
    // ],
    // );
  }
}
  // return BlocBuilder<EcommerceBloc, EcommerceState>(
  //   builder: (context, state) {
  //     return ListView.builder(
  //       itemCount: state.cart.length,
  //       itemBuilder: (context, index) {
  //         if (state.cart.isEmpty) {
  //           return const SizedBox.shrink();
  //         }
  //         final product = state.cart[index];
  //         return ListTile(
  //           leading: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Icon(Icons.check_box),
  //               Container(
  //                 width: 60,
  //                 height: 120,
  //                 decoration: BoxDecoration(
  //                   color: AppColors.greyBackground,
  //                   borderRadius: BorderRadius.circular(8),
  //                 ),
  //                 child: Image.network(product.imageUrl),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(left: 8),
  //                 child: Column(
  //                   children: [
  //                     SizedBox(
  //                       width: 200,
  //                       child: Text(
  //                         product.name,
  //                         style: TextStyle(fontSize: 10),
  //                       ),
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       //crossAxisAlignment: CrossAxisAlignment.baseline,
  //                       children: [
  //                         SizedBox(
  //                           width: 120,
  //                           child: Text(
  //                             product.price.toString(),
  //                             //textAlign: TextAlign.start,
  //                             style: TextStyle(fontSize: 10),
  //                           ),
  //                         ),
  //                         CircleAvatar(
  //                           backgroundColor: AppColors.greyBackground,
  //                           radius: 10,
  //                           child: Text("-"),
  //                         ),
  //                         Padding(
  //                           padding:
  //                               const EdgeInsets.symmetric(horizontal: 8),
  //                           child: Text(product.quantity.toString()),
  //                         ),
  //                         CircleAvatar(
  //                           backgroundColor: AppColors.greyBackground,
  //                           radius: 10,
  //                           child: Text("+"),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     );
  //   },
  // );

