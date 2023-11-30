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
    this.initalPgs,
    this.initalPsgs,
    this.resetMachines,
    this.saveMachines,
    this.isMachinesSaved,
  });
  final List<Screen> icons;
  final bool needsValidation;
  final bool needsDeconexion;
  final GlobalKey<FormState>? formKey;
  final Costumer? costumer;
  final Tech? tech;
  final Map? techProperties;
  final List<String>? initalPgs;
  final List<String>? initalPsgs;
  final void Function()? resetMachines;
  final void Function()? saveMachines;
  final bool? isMachinesSaved;
  @override
  Widget build(BuildContext context) {
    Widget deconexion = needsDeconexion ? const Deconexion() : const SizedBox();
    Widget validation = needsValidation
        ? ValidationFooter(
            formKey: formKey,
            tech: vahe,
            techProperties: techProperties,
            initalPgs: initalPgs,
            initalPsgs: initalPsgs,
            resetMachines: resetMachines,
            saveMachines: saveMachines,
          )
        : const SizedBox();
    return Column(
      children: [
        deconexion,
        validation,
        Container(
          height: 92,
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var icon in icons)
                FooterIcon(
                  icon: icon,
                  resetMachines: resetMachines,
                  isMachinesSaved: isMachinesSaved,
                )
            ],
          ),
        ),
      ],
    );
  }
}
