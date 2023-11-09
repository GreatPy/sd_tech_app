import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/enums/rights.dart';

Costumer costumer1 = Costumer(
  id: 1,
  firstname: "Pierro",
  lastname: "BERNARDIN DE LA GRANDE MOTTE",
  address: "3 rue de la poupée qui tousse, 9219 MEUDON",
  city: "MEUDON LA FORET SUR SEINE",
  birthdate: DateTime(1980, 04, 24),
  phone: "06 78 65 55 43",
  mail: "pierrobern@gmail.fr",
  nir: "1 80 92 04 634 228 43",
  hight: "178",
  weight: "75",
  rights: Rights.required,
);
Costumer costumer2 = Costumer(
  id: 2,
  firstname: "Bernarda",
  lastname: "PATCHOULI",
  address: "46 rue Pivot, 75002 PARIS",
  city: "PARIS",
  birthdate: DateTime(1998, 12, 03),
  phone: "06 98 00 21 21",
  mail: "superbernarda@gmail.fr",
  nir: "2 98 52 12 687 133 71",
  hight: "178",
  weight: "75",
  rights: Rights.required,
);
Costumer costumer3 = Costumer(
  id: 3,
  firstname: "Patrique",
  lastname: "DURANT",
  address: "33 rue Minet, 92130 CLAMART",
  city: "CLAMART",
  birthdate: DateTime(1982, 05, 12),
  phone: "06 77 23 85 85",
  mail: "patoch@wanadoo.fr",
  nir: "1 82 92 05 883 829 10",
  hight: "166",
  weight: "86",
  rights: Rights.required,
);
Costumer costumer4 = Costumer(
  id: 4,
  firstname: "Mohamed",
  lastname: "YOUCEF",
  address: "302 av de la Republique 93250 BONDY",
  city: "BONDY",
  birthdate: DateTime(2002, 01, 30),
  phone: "07 22 78 37 21",
  mail: "momo@yahoo.fr",
  nir: "1 02 93 01 501 735 13",
  hight: "190",
  weight: "107",
  rights: Rights.notRequired,
);
Costumer costumer5 = Costumer(
  id: 5,
  firstname: "Marie",
  lastname: "BEN GUIGUI",
  address: "67 rue du temple, 75002 PARIS",
  city: "PARIS",
  birthdate: DateTime(1967, 04, 18),
  phone: "07 03 88 24 29",
  mail: "guiguim@gmail.fr",
  nir: "2 67 75 04 876 001 93",
  hight: "158",
  weight: "49",
  rights: Rights.required,
);

final List<Costumer> costumers = [
  costumer1,
  costumer2,
  costumer3,
  costumer4,
  costumer5
];