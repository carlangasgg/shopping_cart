import 'package:flutter/material.dart';
import 'package:shopping_cart/widgets/app_colors.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        children: [
          categoryHeader(),
          Expanded(
            child: categoryListItems(),
          ),
        ],
      ),
    );
  }

  Widget categoryHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "See all",
            style: TextStyle(
              color: AppColors.greyLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryListItems() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.greyBackground,
                radius: 21,
              ),
              Text(
                "Phones",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
