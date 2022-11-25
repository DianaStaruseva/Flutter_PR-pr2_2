import '../../domain/entity/product_add_entity.dart';

class AddProduct extends AddProductEntity {

  AddProduct({
    super.id,
    required super.quantity,
    required super.idProduct,
  }) : super();

  Map<String, dynamic> toMap() => {
        'id': id,
        'quantity': quantity,
        'id_product': idProduct.id,
      };

  factory AddProduct.toFromMap(Map<String, dynamic> json) => AddProduct(
      id: json['id'],
      quantity: json['quantity'],
      idProduct: json['idProduct']);
}