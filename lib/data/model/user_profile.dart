import '../../domain/entity/user_entity.dart';
import '../../domain/entity/user_profile_entity.dart';

class Profile extends ProfileEntity {

final String? middleName;

  Profile({
    super.id,
    required super.surname,
    required super.name,
    this.middleName,
    super.address,
    required super.birthDate,
    required super.idUser,
  }) : super();

  Map<String, dynamic> toMap() => {
        'id': id,
        'surname': surname,
        'name': name,
        'middleName': middleName,
        'address': address,
        'birthDate': birthDate,
        'id_user': idUser.id,
      };

  factory Profile.toFromMap(Map<String, dynamic> json) => Profile(
      id: json['id'],
      middleName: json['middleName'],
      address: json['address'],
      name: json['name'],
      surname: json['surname'],
      idUser: json['idUser'],
      birthDate: json['birthDate']
      );
}
