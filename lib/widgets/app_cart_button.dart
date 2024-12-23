import 'package:flutter/material.dart';
import 'package:shopping_cart/widgets/app_colors.dart';
import 'package:shopping_cart/widgets/app_primary_button.dart';

class AppCartButton extends StatelessWidget {
  const AppCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AppPrimaryButton(
          onTap: () {},
          height: size.height * .075,
          text: "Add to cart",
        ),
      ),
    );
  }
}
