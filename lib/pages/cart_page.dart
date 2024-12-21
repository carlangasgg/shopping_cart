import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/pages/bloc/ecommerce_bloc.dart';
import 'package:shopping_cart/widgets/app_colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EcommerceBloc, EcommerceState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.cart.length,
          itemBuilder: (context, index) {
            if (state.cart.isEmpty) {
              return const SizedBox.shrink();
            }
            final product = state.cart[index];
            return ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_box),
                  Container(
                    width: 60,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.greyBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(product.imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            product.name,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Text(
                                product.price.toString(),
                                //textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: AppColors.greyBackground,
                              radius: 10,
                              child: Text("-"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(product.quantity.toString()),
                            ),
                            CircleAvatar(
                              backgroundColor: AppColors.greyBackground,
                              radius: 10,
                              child: Text("+"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //leading: Text(
              //  product.quantity.toString(),
              //),
            );
          },
        );
      },
    );
  }
}
