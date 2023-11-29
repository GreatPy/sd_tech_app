import 'package:flutter/material.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/tech.dart';
import 'package:sd_tech/widgets/generals/footer/deconexion.dart';
import 'package:sd_tech/widgets/generals/footer/validation_footer.dart';
import 'package:sd_tech/widgets/generals/footer/footer_icon.dart';
import 'package:sd_tech/models/enums/screen.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.icons,
    required this.needsValidation,
    required this.needsDeconexion,
    this.formKey,
    this.costumer,
    this.tech,
    this.techProperties,
  });
  final List<Screen> icons;
  final bool needsValidation;
  final bool needsDeconexion;
  final GlobalKey<FormState>? formKey;
  final Costumer? costumer;
  final Tech? tech;
  final Map? techProperties;
  @override
  Widget build(BuildContext context) {
    Widget deconexion = needsDeconexion ? const Deconexion() : const SizedBox();
    Widget validation = needsValidation
        ? ValidationFooter(
            formKey: formKey,
            tech: vahe,
            techProperties: techProperties,
          )
        : const SizedBox();
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
