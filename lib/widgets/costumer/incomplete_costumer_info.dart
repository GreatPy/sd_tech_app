import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class IncompleCostumerInfo extends StatelessWidget {
  const IncompleCostumerInfo({
    super.key,
    required this.hight,
  });
  final double hight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: dangerColor,
              size: 32,
            ),
            StyledText(
              content: "Dossier patient incomplet",
              color: dangerColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            Icon(
              Icons.warning_amber_rounded,
              color: dangerColor,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
