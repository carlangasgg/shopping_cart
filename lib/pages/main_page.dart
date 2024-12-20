import 'package:flutter/material.dart';
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

  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text("Catálogo en construcción")),
    const CartPage(),
    const Center(child: Text("Favoritos en construcción")),
    const Center(child: Text("Perfil en construcción")),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: AppColors.greenLime),
            icon: Icon(Icons.home, color: AppColors.black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.search, color: AppColors.greenLime),
            icon: Icon(Icons.search, color: AppColors.black),
            label: "Catalog",
          ),
          BottomNavigationBarItem(
            activeIcon:
                Icon(Icons.shopping_bag_outlined, color: AppColors.greenLime),
            icon: Icon(Icons.shopping_bag_outlined, color: AppColors.black),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite_border, color: AppColors.greenLime),
            icon: Icon(Icons.favorite_border, color: AppColors.black),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person, color: AppColors.greenLime),
            icon: Icon(Icons.person, color: AppColors.black),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
