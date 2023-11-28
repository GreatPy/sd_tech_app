import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class GpsContent extends StatelessWidget {
  const GpsContent({
    super.key,
    required this.roughExam,
  });
  final RoughExam roughExam;
  @override
  Widget build(BuildContext context) {
    final String? address = roughExam.customer.address;
    Widget missingAddress = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.warning_amber_rounded, color: dangerColor),
        StyledText(
          content: "Adresse non renseignée",
          color: dangerColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        Icon(Icons.warning_amber_rounded, color: dangerColor)
      ],
    );
    Widget presentAddress = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledText(
          content: "l'adresse suivant est dans le presse papier",
          color: neutral,
        ),
        StyledText(
          content: address,
          color: primaryColorLigth,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
    Widget addressContent =
        address == null || address.isEmpty ? missingAddress : presentAddress;
    return Body(
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: addressContent,
          ),
        ],
      ),
      footer: const Footer(
        icons: [Screen.planning],
        needsValidation: false,
        needsDeconexion: false,
      ),
    );
  }
}
