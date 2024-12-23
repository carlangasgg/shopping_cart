import 'package:flutter/material.dart';
import 'package:shopping_cart/widgets/app_colors.dart';
import 'package:shopping_cart/widgets/cart_body_select_all.dart';
import 'package:shopping_cart/widgets/cart_body_view_tile.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .575, // Constrain the height
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: const Column(
        children: [
          SizedBox(
            height: 15,
          ),
          CartBodySelectAll(),
          CartBodyViewTile(),
        ],
      ),
    );
  }
}
