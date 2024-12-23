import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/pages/bloc/ecommerce_bloc.dart';
import 'package:shopping_cart/widgets/app_colors.dart';

class CartBodyViewTile extends StatelessWidget {
  const CartBodyViewTile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
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
                leading: Icon(Icons.check_box, color: AppColors.blueLight),
                title: Row(
                  children: [
                    Image.network(
                      product.imageUrl,
                      width: size.width * .2,
                      height: size.height * .1,
                    ),
                    SizedBox(
                      width: size.width * .45,
                      child: Column(
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${product.price}",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors.greyBackground,
                                radius: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    if (product.quantity > 1) {
                                      context.read<EcommerceBloc>().add(
                                            RemoveToCartEvent(
                                              product: product,
                                            ),
                                          );
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: AppColors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Text(product.quantity.toString()),
                              CircleAvatar(
                                backgroundColor: AppColors.greyBackground,
                                radius: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<EcommerceBloc>().add(
                                          AddToCartEvent(
                                            product: product,
                                          ),
                                        );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: GestureDetector(
                  onTap: () {
                    context.read<EcommerceBloc>().add(
                          RemoveElementEvent(
                            product: product,
                          ),
                        );
                  },
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.red,
                    size: 16,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
