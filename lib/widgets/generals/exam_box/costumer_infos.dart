import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/exam_costumer_info_line.dart';
import 'package:sd_tech/widgets/generals/exam_box/scrolable_row.dart';

class CostumerInfos extends StatelessWidget {
  const CostumerInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ScrolableRow(
          line: ExamCostuerInfoLine.fullName,
          content: "Bachir Elmondourman HAZAKARHOUAMANA ROUZIKIKiMINOU",
        ),
        ScrolableRow(
          line: ExamCostuerInfoLine.city,
          content: "SAINT EMILIE LA FORET SUR OISE",
        ),
        ScrolableRow(
          //if status == tobeScheduled:line = delay ,else: line = time
          line: ExamCostuerInfoLine.delay,
          content: "239 jours",
        ),
      ],
    );
  }
}
