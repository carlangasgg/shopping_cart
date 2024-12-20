import 'package:flutter/material.dart';
import 'package:shopping_cart/data.dart';
import 'package:shopping_cart/widgets/app_colors.dart';
import 'package:shopping_cart/widgets/app_primary_button.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        16,
        16,
        0,
      ),
      child: GridView.builder(
        itemCount: productsJson.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          final product = productsJson[index];
          return _buildCardProduct(
            title: product["description"],
            price: product["price"].toString(),
            productId: product["id"].toString(),
            imageUrl: product["image_url"],
          );
        },
      ),
    );
  }

  _buildCardProduct({
    required String title,
    required String price,
    required String productId,
    required String imageUrl,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.greyBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.network(imageUrl),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppPrimaryButton(
          onTap: () {},
          height: 30,
          text: "Add to cart",
        ),
      ],
    );
  }
}
