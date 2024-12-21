import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/model/product_model.dart';
import 'package:shopping_cart/pages/bloc/ecommerce_bloc.dart';
import 'package:shopping_cart/widgets/app_colors.dart';
import 'package:shopping_cart/widgets/app_primary_button.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        16,
        16,
        0,
      ),
      child: BlocBuilder<EcommerceBloc, EcommerceState>(
        builder: (context, state) {
          if (state.homeScreenState == HomeScreenState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.5,
            ),
            itemBuilder: (context, index) {
              final product = state.products[index];
              return _buildCardProduct(
                context: context,
                product: product,
              );
            },
          );
        },
      ),
    );
  }

  _buildCardProduct({
    required BuildContext context,
    required ProductModel product,
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
          child: Image.network(product.imageUrl),
        ),
        const SizedBox(height: 4),
        Text(
          product.name,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "\$${product.price}",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppPrimaryButton(
          onTap: () {
            context.read<EcommerceBloc>().add(
                  AddToCartEvent(
                    product: product,
                  ),
                );
          },
          height: 30,
          text: "Add to cart",
        ),
      ],
    );
  }
}
