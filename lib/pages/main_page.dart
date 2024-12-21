import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/pages/bloc/ecommerce_bloc.dart';
import 'package:shopping_cart/pages/cart_page.dart';
import 'package:shopping_cart/pages/home_page.dart';
import 'package:shopping_cart/widgets/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    Center(child: Text("Catalog coming soon")),
    CartPage(),
    Center(child: Text("Favorites coming soon")),
    Center(child: Text("Profile coming soon")),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        color: AppColors.white,
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _itemBottomMenu(
              onTap: () => onItemTapped(0),
              isActive: selectedIndex == 0,
              title: "Home",
              icon: Icons.home,
            ),
            _itemBottomMenu(
              onTap: () => onItemTapped(1),
              isActive: selectedIndex == 1,
              title: "Catalog",
              icon: Icons.search,
            ),
            _itemBottomMenu(
              onTap: () => onItemTapped(2),
              isActive: selectedIndex == 2,
              isCartItem: true,
              title: "Cart",
              icon: Icons.shopping_bag_outlined,
            ),
            _itemBottomMenu(
              onTap: () => onItemTapped(3),
              isActive: selectedIndex == 3,
              title: "Favorite",
              icon: Icons.favorite_border,
            ),
            _itemBottomMenu(
              onTap: () => onItemTapped(4),
              isActive: selectedIndex == 4,
              title: "Profile",
              icon: Icons.person,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemBottomMenu({
    required Function() onTap,
    required bool isActive,
    required String title,
    required IconData icon,
    bool isCartItem = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Icon(
                icon,
                color: isActive ? AppColors.greenLime : AppColors.black,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          if (isCartItem)
            BlocBuilder<EcommerceBloc, EcommerceState>(
              builder: (context, state) {
                if (state.cart.isEmpty) {
                  return const SizedBox.shrink();
                }

                final total = state.cart.fold(0, (sum, p) => sum + p.quantity);

                return Positioned(
                  top: -5,
                  right: -5,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        total.toString(),
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
