import '../../domain/entity/product_entity.dart';

class Product extends ProductEntity {

  Product({
    super.id,
    required super.productName,
    required super.price,
    required super.idCharacteristics,
  }) : super();

  Map<String, dynamic> toMap() => {
        'id': id,
        'productName': productName,
        'price': price,
        'id_characteristics': idCharacteristics.id,
      };

  factory Product.toFromMap(Map<String, dynamic> json) => Product(
      id: json['id'],
      productName: json['productName'],
      price: json['price'],
      idCharacteristics: json['idCharacteristics']);
}