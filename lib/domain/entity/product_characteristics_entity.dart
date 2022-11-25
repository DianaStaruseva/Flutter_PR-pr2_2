import 'dart:html';

import 'package:pr2/domain/entity/product_category_entity.dart';
import 'package:pr2/domain/entity/product_type_entity.dart';

class CharacteristicsEntity{
    late int id;
    final double width;
    final double length;
    final double height;
    final double weight;
    final String color;
    final CategoryEntity idCategory;
    final TypeEntity idType;

  CharacteristicsEntity({
    this.id =0,
    required this.width,
    required this.length,
    required this.height,
    required this.weight,
    required this.color,
    required this.idCategory,
    required this.idType,
  });
}