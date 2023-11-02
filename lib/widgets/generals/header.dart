import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/enums/screen.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key, required this.screen});
  final Screen screen;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    late IconData iconData;
    late String title;
    switch (screen) {
      case Screen.planning:
        title = "Planning";
        iconData = Icons.calendar_today_outlined;
      case Screen.profile:
        title = "Profile";
        iconData = Icons.person_outline;
      case Screen.searche:
        iconData = Icons.search_outlined;
        title = "Recherche";
      case Screen.filters:
        iconData = Icons.filter_alt_outlined;
        title = "Filtres";
      case Screen.today:
        title = "Aujourd'hui";
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
