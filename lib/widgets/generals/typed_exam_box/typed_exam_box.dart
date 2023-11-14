import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';
import 'package:sd_tech/widgets/generals/typed_exam_box/typed_costumer_infos.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_type_box.dart';
import 'package:sd_tech/widgets/generals/exam_box/payement_status_box.dart';

class TypedExamBox extends StatefulWidget {
  const TypedExamBox({
    super.key,
    required this.exam,
  });
  final TypedExam exam;
  @override
  State<TypedExamBox> createState() => _TypedExamBoxState();
}

class _TypedExamBoxState extends State<TypedExamBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const ExamTypeBox(
                  examType: ExamTypeEnum.pg,
                ),
                const SizedBox(width: 8),
                Expanded(child: TypedCostumerInfos(exam: widget.exam)),
                const SizedBox(width: 8),
                Icon(
                  Icons.warning_amber_rounded,
                  color: dangerColor,
                  size: 32,
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.hourglass_empty_outlined,
                  size: 32,
                  color: primaryColorLigth,
                ),
                const SizedBox(width: 4),
                const PayementStatusBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
