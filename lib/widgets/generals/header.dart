import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    super.key,
    required this.screen,
    this.exam,
  });
  final Screen screen;
  final TypedExam? exam;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Costumer? costumer;
    if (exam != null) {
      costumer = exam!.roughExam.customer;
    }
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
        iconData = Icons.filter_list_outlined;
        title = "Filtres";
      case Screen.today:
        title = "Aujourd'hui";
        iconData = Icons.bookmark_outline;
      case Screen.patient:
        title = """${costumer!.firstname}
${costumer.lastname}""";
        iconData = Icons.sentiment_satisfied;
      default:
    }
    Icon icon = Icon(iconData, color: whiteColor);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      leading: icon,
      title: StyledText(
        content: title,
        fontSize: 16,
        textAlign: TextAlign.center,
      ),
    );
  }
}
