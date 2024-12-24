import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/model/product_model.dart';
import 'package:uuid/uuid.dart';

part 'ecommerce_event.dart';
part 'ecommerce_state.dart';

const homeUrl = "https://demoluisfelipe.firebaseio.com/adl_ecommerce";
const cartUrl = "https://demoluisfelipe.firebaseio.com/adl_ecommerce_cart_cfbr";

class EcommerceBloc extends Bloc<EcommerceEvent, EcommerceState> {
  var uuid = Uuid();
  var dio = Dio();

  EcommerceBloc() : super(EcommerceState.initial()) {
    on<LoadProductsEvent>(_onLoadProductsEvent);
    on<LoadCartItemsEvent>(_onLoadCartItemsEvent);
    on<AddToCartEvent>(_onAddToCartEvent);
    on<UpdateCartQuantityEvent>(_onUpdateCartQuantityEvent);
    on<RemoveToCartEvent>(_onRemoveToCartEvent);
    on<RemoveElementEvent>(_onRemoveElementEvent);
  }

  void _onLoadProductsEvent(
      LoadProductsEvent event, Emitter<EcommerceState> emit) async {
    emit(state.copyWith(homeScreenState: HomeScreenState.loading));

    final response = await dio.get("$homeUrl.json");

    final products =
        (response.data as Map<String, dynamic>).entries.map((product) {
      return ProductModel(
        id: product.key,
        name: product.value["description"],
        category: product.value["product"],
        price: double.parse(product.value["price"].toString()),
        imageUrl: product.value["image_url"],
        priceQuantity: double.parse(product.value["price"].toString()),
      );
    }).toList();

    emit(
      state.copyWith(
        homeScreenState: HomeScreenState.success,
        products: products,
      ),
    );
  }

  void _onLoadCartItemsEvent(
      LoadCartItemsEvent event, Emitter<EcommerceState> emit) async {
    List<ProductModel> cartItems = [];
    final responseCart = await dio.get("$cartUrl.json");

    cartItems =
        (responseCart.data as Map<String, dynamic>).entries.map((product) {
      return ProductModel(
        id: product.key,
        name: product.value["description"],
        category: product.value["product"],
        price: double.parse(product.value["price"].toString()),
        imageUrl: product.value["image_url"],
        priceQuantity: double.parse(product.value["price"].toString()),
      );
    }).toList();

    emit(
      state.copyWith(
        homeScreenState: HomeScreenState.success,
        cart: cartItems,
      ),
    );
  }

  Future<void> _onAddToCartEvent(
      AddToCartEvent event, Emitter<EcommerceState> emit) async {
    var uuid = const Uuid().v1();

    await dio.post(
      "$cartUrl/$uuid.json",
      data: {
        "id": uuid,
        "description": event.product.name,
        "product": event.product.category,
        "image_url": event.product.imageUrl,
        "price": event.product.price
      },
    );

    //emit(state.copyWith(cart: updateCart));
    // 1- Enviar el producto al backend
    // var response = await dio.post(cartUrl/{uuid.v1()}.json, data: {'id': 12, 'name': 'dio'});
    // {cartUrl}/{uuid.v1()}.json
    // {
    //   "id": event.product.id,
    //   "description": event.product.description,
    //   "product": event.product.product,
    //   "image_url": event.product.imageUrl,
    //   "price": event.product.price
    // }
    // 2- Cargar los productos del carro en la pagina CartPage
    // - crear un nuevo metodo en bloc (LoadCartItems)
    // value: context.read<EcommerceBloc>()..add(LoadCartItemsEvent()),
    final exist = state.cart.firstWhere(
      (p) => p.id == event.product.id,
      orElse: () => event.product.copyWith(quantity: 0),
    );

    final updateCart = state.cart.map((p) {
      if (p.id == event.product.id) {
        return p.copyWith(
          quantity: p.quantity + 1,
          //priceQuantity: (p.quantity + 1) * p.price);
        );
      }
      return p;
    }).toList();

    if (exist.quantity == 0) {
      updateCart.add(
        event.product.copyWith(quantity: 1),
      );
    }

//     var response = await dio.post(cartUrl/{uuid.v1()}.json, data: {'id': 12, 'name': 'dio'},);
// //
    emit(state.copyWith(cart: updateCart));
  }

  void _onUpdateCartQuantityEvent(
      UpdateCartQuantityEvent event, Emitter<EcommerceState> emit) {}

  void _onRemoveToCartEvent(
      RemoveToCartEvent event, Emitter<EcommerceState> emit) {
    final exist = state.cart.firstWhere(
      (p) => p.id == event.product.id,
      orElse: () => event.product.copyWith(quantity: 0),
    );

    final updateCart = state.cart.map((p) {
      if (p.id == event.product.id) {
        return p.copyWith(
            quantity: p.quantity - 1,
            priceQuantity: (p.quantity - 1) * p.price);
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

  void _onRemoveElementEvent(
      RemoveElementEvent event, Emitter<EcommerceState> emit) {
    final product = state.cart.firstWhere(
      (p) => p.id == event.product.id,
    );

    final updateCart = state.cart;

    updateCart.remove(product);

    emit(state.copyWith(cart: updateCart));
  }
}
