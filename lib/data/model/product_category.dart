import 'package:pr2/domain/entity/role_entity.dart';

import '../../domain/entity/product_category_entity.dart';

class Category extends CategoryEntity {


  late int id;
  final String category;

  Category(this.id, this.category)
      : super(id, category);

  Map<String, dynamic> toMap() => {
        'id': id,
        'country': category,
      };

  factory Category.toFromMap(Map<String, dynamic> json) => Category(json['id'],
      json['category']);
}