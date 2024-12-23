import 'package:flutter/material.dart';
import 'package:shopping_cart/widgets/app_cart_button.dart';
import 'package:shopping_cart/widgets/cart_appbar.dart';
import 'package:shopping_cart/widgets/cart_body.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CartAppbar(),
        SizedBox(
          height: 10,
        ),
        CartBody(),
        AppCartButton(),
      ],
    );
  }
}
