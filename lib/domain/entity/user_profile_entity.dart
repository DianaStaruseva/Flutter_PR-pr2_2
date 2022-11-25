import 'package:pr2/domain/entity/user_entity.dart';

class ProfileEntity{
    late int id;
    final String surname;
    final String name;
    final String? middleName;
    final String ?address;
    final int birthDate; 
    final UserEntity idUser;

  ProfileEntity({
    this.id =0,
    required this.surname,
    required this.name,
    this.middleName,
    this.address,
    required this.birthDate,
    required this.idUser
  });
}