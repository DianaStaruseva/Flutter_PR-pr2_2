import '../../domain/entity/basket_entity.dart';

class Basket extends BasketEntity {

  Basket({
    super.id,
    required super.totalAmount,
    required super.idAddProduct,
    required super.idProfile
  }) : super();

  Map<String, dynamic> toMap() => {
        'id': id,
        'totalAmount': totalAmount,
        'id_addProduct': idAddProduct.id,
        'id_profile': idProfile.id,
      };

  factory Basket.toFromMap(Map<String, dynamic> json) => Basket(
      id: json['id'],
      totalAmount: json['totalAmount'],
      idAddProduct: json['idAddProduct'],
      idProfile: json['idProfile']);
}