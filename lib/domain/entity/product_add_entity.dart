
import 'package:pr2/domain/entity/product_entity.dart';

class AddProductEntity{
    late int id;
    final int quantity;
    final ProductEntity idProduct;

  AddProductEntity({
    this.id =0,
    required this.quantity,
    required this.idProduct,
  });
}