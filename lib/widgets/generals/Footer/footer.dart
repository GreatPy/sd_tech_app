import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/Footer/footer_icon.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/widgets/profile/validation_footer.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.icons,
    required this.isKeyboardDisplayed,
  });
  final List<Screen> icons;
  final bool isKeyboardDisplayed;

  @override
  Widget build(BuildContext context) {
    if (!isKeyboardDisplayed) {
      return Container(
        height: 92,
        // width: double.infinity,
        color: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //action items:
            for (var icon in icons) FooterIcon(icon: icon)
          ],
        ),
      );
    }
    if (isKeyboardDisplayed) {
      return const ValidationFooter();
    }
    return const Placeholder();

    //purple footer:
  }
}
