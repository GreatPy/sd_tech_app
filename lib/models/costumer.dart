import 'package:sd_tech/models/enums/rights.dart';

class Costumer {
  const Costumer({
    required this.id,
    this.firstname,
    this.lastname,
    this.birthdate,
    this.mail,
    this.nir,
    this.phone,
    this.address,
    this.weight,
    this.hight,
    this.rights,
  });
  final int id;
  final String? firstname;
  final String? lastname;
  final DateTime? birthdate;
  final String? mail;
  final String? nir;
  final String? phone;
  final String? address;
  final int? weight;
  final int? hight;
  final Rights? rights;
}
