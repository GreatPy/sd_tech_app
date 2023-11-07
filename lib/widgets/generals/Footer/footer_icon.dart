import 'package:flutter/material.dart';
import 'package:sd_tech/Screens/Profile.dart';
import 'package:sd_tech/Screens/search.dart';
import 'package:sd_tech/Screens/filters.dart';
import 'package:sd_tech/Screens/today.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/styles.dart';

class FooterIcon extends StatelessWidget {
  const FooterIcon({
    super.key,
    required this.icon,
  });
  final Screen icon;

  @override
  Widget build(BuildContext context) {
    late final IconData iconData;
    late final Widget page;
    switch (icon) {
      case Screen.profile:
        iconData = Icons.person_outline;
        page = const Profile();
      case Screen.searche:
        iconData = Icons.search;
        page = const Search();
      case Screen.filters:
        iconData = Icons.filter_list_outlined;
        page = const Filters();
      case Screen.today:
        iconData = Icons.bookmark_outline;
        page = const Today();
      case Screen.keyboard:
        iconData = Icons.arrow_drop_down_circle_outlined;
      case Screen.planning:
        iconData = Icons.arrow_back_ios_new_rounded;
        page = const Placeholder();
    }
    setPage(page, iconData) {
      if (iconData != Icons.arrow_back_ios_new_rounded) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      }
      if (iconData == Icons.arrow_back_ios_new_rounded) {
        Navigator.of(context).pop();
      }
    }

    return IconButton(
      onPressed: () {
        setPage(page, iconData);
      },
      icon: Icon(iconData, color: whiteColor, size: 24),
    );
  }
}
