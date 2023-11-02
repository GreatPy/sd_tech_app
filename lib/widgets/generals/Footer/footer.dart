import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/Footer/footer_icon.dart';
import 'package:sd_tech/models/enums/screen.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.icons});
  final List<Screen> icons;

  @override
  Widget build(BuildContext context) {
    //purple footer:
    return Container(
      height: 92,
      // width: double.infinity,
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //action items:
          for (var icon in icons) FooterIcon(icon: icon),
        ],
      ),
    );
  }
}
