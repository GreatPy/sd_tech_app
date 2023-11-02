import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key, required this.title});
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    late IconData iconData;
    switch (title) {
      case 'Planning':
        iconData = Icons.calendar_today_outlined;
      case 'Profile':
        iconData = Icons.person_outline;
      case 'Recherche':
        iconData = Icons.search_outlined;
      case 'Filtres':
        iconData = Icons.filter_alt_outlined;
      case "Aujourd'hui":
        iconData = Icons.bookmark_outline;
    }
    Icon icon = Icon(iconData, color: whiteColor);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      leading: icon,
      title: Text(title),
    );
  }
}
