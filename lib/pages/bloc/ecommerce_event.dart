part of 'ecommerce_bloc.dart';

sealed class EcommerceEvent extends Equatable {
  const EcommerceEvent();

  @override
  List<Object> get props => [];
}

class LoadProductsEvent extends EcommerceEvent {}

class LoadCartItemsEvent extends EcommerceEvent {}

class AddToCartEvent extends EcommerceEvent {
  final ProductModel product;

  const AddToCartEvent({required this.product});
}

class UpdateCartQuantityEvent extends EcommerceEvent {}

class RemoveToCartEvent extends EcommerceEvent {
  final ProductModel product;

  const RemoveToCartEvent({required this.product});
}

class RemoveElementEvent extends EcommerceEvent {
  final ProductModel product;

  const RemoveElementEvent({required this.product});
}
