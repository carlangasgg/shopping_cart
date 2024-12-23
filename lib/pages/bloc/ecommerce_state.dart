part of 'ecommerce_bloc.dart';

enum HomeScreenState {
  none,
  loading,
  success,
  failure,
}

class EcommerceState extends Equatable {
  final List<ProductModel> products;
  final List<ProductModel> cart;
  final HomeScreenState homeScreenState;

  const EcommerceState(
      {required this.products,
      required this.cart,
      required this.homeScreenState});

  factory EcommerceState.initial() {
    return EcommerceState(
      products: [],
      cart: [],
      homeScreenState: HomeScreenState.none,
    );
  }

  EcommerceState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? cart,
    HomeScreenState? homeScreenState,
  }) {
    return EcommerceState(
      cart: cart ?? this.cart,
      products: products ?? this.products,
      homeScreenState: homeScreenState ?? this.homeScreenState,
    );
  }

  @override
  List<Object> get props => [products, cart, homeScreenState];
}
