import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:shopping_cart/pages/bloc/ecommerce_bloc.dart';
import 'package:shopping_cart/widgets/app_colors.dart';
import 'package:shopping_cart/widgets/categories_widget.dart';
import 'package:shopping_cart/widgets/product_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<EcommerceBloc>()..add(LoadProductsEvent()),
      child: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greyBackground,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: AppColors.greenLime,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image(
                image: const Svg('assets/icons/percent.svg'),
                color: AppColors.black,
              ),
            ),
          ),
        ),
        title: SizedBox(
          width: size.width,
          child: Column(
            children: [
              Text(
                "Delivery Addres",
                style: TextStyle(
                  color: AppColors.greyLight,
                  fontSize: 12,
                ),
              ),
              Text(
                "Grove Street, Ganton, Los Santos.",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: AppColors.greyLight,
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: const Column(
          children: [
            CategoriesWidget(),
            Expanded(child: ProductWidget()),
          ],
        ),
      ),
    );
  }
}
