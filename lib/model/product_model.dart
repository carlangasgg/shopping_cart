import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final int quantity;
  final double priceQuantity;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
    required this.priceQuantity,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? category,
    double? price,
    String? imageUrl,
    int? quantity,
    double? priceQuantity,
  }) {
    return ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        quantity: quantity ?? this.quantity,
        priceQuantity: priceQuantity ?? this.priceQuantity);
  }

  @override
  List<Object> get props => [
        id,
        name,
        category,
        price,
        imageUrl,
        quantity,
        priceQuantity,
      ];
}
