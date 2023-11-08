import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/enums/rights.dart';

Costumer costumer1 = Costumer(
  id: 1,
  firstname: "Pierro",
  lastname: "BERNARDIN",
  address: "3 rue de la poupée qui tousse, 9219 MEUDON",
  birthdate: DateTime(1980, 04, 24),
  phone: "06 78 65 55 43",
  mail: "pierrobern@gmail.fr",
  nir: "1 80 92 04 634 228 43",
  hight: 178,
  weight: 75,
  rights: Rights.required,
);
Costumer costumer2 = Costumer(
  id: 1,
  firstname: "Bernarda",
  lastname: "PATCHOULI",
  address: "46 rue Pivot, 75002 PARIS",
  birthdate: DateTime(1998, 12, 03),
  phone: "06 98 00 21 21",
  mail: "superbernarda@gmail.fr",
  nir: "2 98 52 12 687 133 71",
  hight: 178,
  weight: 75,
  rights: Rights.required,
);

final List<Costumer> costumers = [
  costumer1,
  costumer2,
];
