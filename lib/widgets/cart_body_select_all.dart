import 'package:flutter/material.dart';
import 'package:shopping_cart/widgets/app_colors.dart';

class CartBodySelectAll extends StatelessWidget {
  const CartBodySelectAll({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * .9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.check_box, color: AppColors.blueLight),
          SizedBox(
            width: size.width * .7,
            child: Text(
              "Select all",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Icon(Icons.file_upload_outlined, size: 16),
          const Icon(Icons.edit_rounded, size: 16),
        ],
      ),
    );
  }
}
