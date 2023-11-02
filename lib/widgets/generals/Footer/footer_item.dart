import 'package:flutter/material.dart';
import 'package:sd_tech/Screens/Profile.dart';
import 'package:sd_tech/Screens/search.dart';
import 'package:sd_tech/widgets/generals/Footer/footer_icon.dart';
import 'package:sd_tech/Screens/filters.dart';
import 'package:sd_tech/Screens/today.dart';

class FooterItem extends StatelessWidget {
  const FooterItem({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    FooterIcon icon = FooterIcon(item: title);
    late final Widget page;
    switch (title) {
      case 'Profile':
        page = const Profile();
      case 'Recherche':
        page = const Search();
      case 'Filtres':
        page = const Filters();
      case "Aujourd'hui":
        page = const Today();
      case 'Back':
        page = const Placeholder();
    }
    setPage(page) {
      if (title != "Back") {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      }
      if (title == "Back") {
        Navigator.of(context).pop();
      }
    }

    return IconButton(
        onPressed: () {
          setPage(page);
        },
        icon: icon);
  }
}
