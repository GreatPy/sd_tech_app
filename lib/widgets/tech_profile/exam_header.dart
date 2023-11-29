import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/tech.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class ExamHeader extends StatelessWidget {
  const ExamHeader({
    super.key,
    required this.examType,
    required this.tech,
  });
  final ExamTypeEnum examType;
  final Tech tech;

  @override
  Widget build(BuildContext context) {
    late String stringMachine;
    late int machineCount;
    late String machineType;
    if (examType == ExamTypeEnum.pg) {
      stringMachine = tech.pgCount > 1 ? "PGs" : "PG";
      machineCount = tech.pgCount;
      machineType = "PG";
    }
    if (examType == ExamTypeEnum.psg) {
      stringMachine = tech.psgCount > 1 ? "PSGs" : "PSG";
      machineCount = tech.psgCount;
      machineType = "PSG";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StyledText(
          content: "$machineCount $stringMachine",
          color: primaryColorLigth,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: primaryColorLigth),
              onPressed: () {},
              child: StyledText(content: "ajouter un $machineType")),
        )
      ],
    );
  }
}
