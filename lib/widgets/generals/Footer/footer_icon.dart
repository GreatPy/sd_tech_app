import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';

class FooterIcon extends StatelessWidget {
  const FooterIcon({super.key, required this.item});
  final String item;
  @override
  Widget build(BuildContext context) {
    late IconData icon;
    switch (item) {
      case 'Profile':
        icon = Icons.person_outline;
      case 'Recherche':
        icon = Icons.search;
      case 'Filtres':
        icon = Icons.filter_alt_outlined;
      case "Aujourd'hui":
        icon = Icons.bookmark_outline;
      case 'Back':
        icon = Icons.arrow_back_ios_rounded;
    }
    return Icon(icon, size: 32, color: whiteColor);
  }
}
