import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/pages/bloc/ecommerce_bloc.dart';
import 'package:shopping_cart/pages/main_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => EcommerceBloc(),
    child: const MaterialApp(home: MainPage()),
  ));
}
