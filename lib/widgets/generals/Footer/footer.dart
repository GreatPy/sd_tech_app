import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/profile/deconexion.dart';
import 'package:sd_tech/widgets/profile/validation_footer.dart';
import 'package:sd_tech/widgets/generals/footer/footer_icon.dart';
import 'package:sd_tech/models/enums/screen.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.icons,
    required this.needsValidation,
    required this.needsDeconexion,
  });
  final List<Screen> icons;
  final bool needsValidation;
  final bool needsDeconexion;

  @override
  Widget build(BuildContext context) {
    Widget deconexion = needsDeconexion ? const Deconexion() : const SizedBox();
    Widget validation =
        needsValidation ? const ValidationFooter() : const SizedBox();
    return Column(
      children: [
        deconexion,
        validation,
        Container(
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
        ),
      ],
    );

    //purple footer:
  }
}
