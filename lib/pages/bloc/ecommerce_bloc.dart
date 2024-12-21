import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/data.dart';
import 'package:shopping_cart/model/product_model.dart';

part 'ecommerce_event.dart';
part 'ecommerce_state.dart';

class EcommerceBloc extends Bloc<EcommerceEvent, EcommerceState> {
  EcommerceBloc() : super(EcommerceState.initial()) {
    on<LoadProductsEvent>(_onLoadProductsEvent);
    on<AddToCartEvent>(_onAddToCartEvent);
    on<UpdateCartQuantityEvent>(_onUpdateCartQuantityEvent);
    on<RemoveToCartEvent>(_onRemoveToCartEvent);
  }

  void _onLoadProductsEvent(
      LoadProductsEvent event, Emitter<EcommerceState> emit) async {
    emit(state.copyWith(homeScreenState: HomeScreenState.loading));
    await Future.delayed(const Duration(seconds: 1));

    final products = productsJson.map((json) {
      return ProductModel(
        id: json["id"].toString(),
        name: json["description"],
        price: double.parse(json["price"].toString()),
        imageUrl: json["image_url"],
      );
    }).toList();

    emit(
      state.copyWith(
        homeScreenState: HomeScreenState.success,
        products: products,
      ),
    );
  }

  void _onAddToCartEvent(AddToCartEvent event, Emitter<EcommerceState> emit) {
    final exist = state.cart.firstWhere(
      (p) => p.id == event.product.id,
      orElse: () => event.product.copyWith(quantity: 0),
    );

    final updateCart = state.cart.map((p) {
      if (p.id == event.product.id) {
        return p.copyWith(quantity: p.quantity + 1);
      }
      return p;
    }).toList();

    if (exist.quantity == 0) {
      updateCart.add(
        event.product.copyWith(quantity: 1),
      );
    }
//
    emit(state.copyWith(cart: updateCart));
  }

  void _onUpdateCartQuantityEvent(
      UpdateCartQuantityEvent event, Emitter<EcommerceState> emit) {}

  void _onRemoveToCartEvent(
      RemoveToCartEvent event, Emitter<EcommerceState> emit) {}
}
