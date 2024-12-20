import 'package:flutter/material.dart';
import 'package:shopping_cart/widgets/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double? height;
  final double? fontSize;

  const AppPrimaryButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height = 50,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.greenLime,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.black,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
