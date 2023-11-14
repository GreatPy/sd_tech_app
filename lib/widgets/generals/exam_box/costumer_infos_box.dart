import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/exam_costumer_info_line.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/scrolable_row.dart';

class CostumerInfos extends StatelessWidget {
  const CostumerInfos({
    super.key,
    required this.exam,
  });
  final TypedExam exam;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrolableRow(
          line: ExamCostuerInfoLine.fullName,
          exam: exam,
        ),
        ScrolableRow(
          line: ExamCostuerInfoLine.city,
          exam: exam,
        ),
        ScrolableRow(
          //if status == tobeScheduled:line = delay ,else: line = time
          line: ExamCostuerInfoLine.delay,
          exam: exam,
        ),
      ],
    );
  }
}
