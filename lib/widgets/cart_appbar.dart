import 'package:flutter/material.dart';
import 'package:shopping_cart/widgets/app_colors.dart';

class CartAppbar extends StatelessWidget {
  const CartAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .2,
      width: size.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Cart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                CircleAvatar(
                  backgroundColor: AppColors.greyBackground,
                  child: const Icon(Icons.more_horiz),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width * .9,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.greyBackground,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.place_outlined, size: 16),
                    SizedBox(
                      width: size.width * .7,
                      child: Text(
                        "Grove Street, Ganton, Los Santos.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
