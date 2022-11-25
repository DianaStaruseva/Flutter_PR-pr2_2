import 'package:pr2/domain/entity/product_add_entity.dart';
import 'package:pr2/domain/entity/user_profile_entity.dart';

class BasketEntity{
    late int id;
    final int totalAmount;
    final ProfileEntity idProfile;
    final AddProductEntity idAddProduct;

  BasketEntity({
    this.id =0,
    required this.totalAmount,
    required this.idProfile,
    required this.idAddProduct,
  });
}