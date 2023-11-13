import 'package:sd_tech/models/enums/rights.dart';

class Costumer {
  const Costumer({
    required this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.mail,
    this.address,
    this.city,
    this.birthdate,
    this.nir,
    this.hight,
    this.weight,
    this.rights,
  });
  final int id;
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? mail;
  final String? address;
  final String? city;
  final DateTime? birthdate;
  final String? nir;
  final int? hight;
  final int? weight;
  final Rights? rights;
}
