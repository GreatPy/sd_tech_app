import 'package:sd_tech/models/enums/rights.dart';

class Costumer {
  const Costumer({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.birthdate,
    required this.mail,
    required this.nir,
    required this.phone,
    required this.address,
    required this.city,
    required this.weight,
    required this.hight,
    required this.rights,
  });
  final int id;
  final String firstname;
  final String lastname;
  final DateTime birthdate;
  final String mail;
  final String nir;
  final String phone;
  final String address;
  final String city;
  final String weight;
  final String hight;
  final Rights rights;
}
