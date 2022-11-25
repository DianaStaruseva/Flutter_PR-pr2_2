import '../../domain/entity/product_characteristics_entity.dart';

class Characteristics extends CharacteristicsEntity {

  Characteristics({
    super.id,
    required super.width,
    required super.length,
    required super.height,
    required super.weight,
    required super.color,
    required super.idCategory,
    required super.idType,
  }) : super();

  Map<String, dynamic> toMap() => {
        'id': id,
        'width': width,
        'length': length,
        'height': height,
        'weight': weight,
        'color': color,
        'id_category': idCategory.id,
        'id_type': idType.id,
      };

  factory Characteristics.toFromMap(Map<String, dynamic> json) => Characteristics(
      id: json['id'],
      width: json['width'],
      length: json['length'],
      height: json['height'],
      weight: json['weight'],
      color: json['color'],
      idCategory: json['idCategory'],
      idType: json['idType']);
}
