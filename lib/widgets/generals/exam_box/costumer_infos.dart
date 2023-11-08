import 'package:flutter/material.dart';
import 'package:sd_tech/widgets/generals/exam_box/scrolable_row.dart';

class CostumerInfos extends StatelessWidget {
  const CostumerInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ScrolableRow(
            content: "Bachir Elmondourman HAZAKARHOUAMANA ROUZIKIKiMINOU"),
        ScrolableRow(content: "SAINT EMILIE LA FORET SUR OISE"),
        ScrolableRow(content: "239 jours"),
      ],
    );
  }
}
