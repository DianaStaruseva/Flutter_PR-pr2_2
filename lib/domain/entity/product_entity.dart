import 'package:pr2/domain/entity/product_characteristics_entity.dart';

class ProductEntity{
    late int id;
    final String productName;
    final double price;
    final CharacteristicsEntity idCharacteristics;

  ProductEntity({
    this.id =0,
    required this.productName,
    required this.price,
    required this.idCharacteristics,
  });
}