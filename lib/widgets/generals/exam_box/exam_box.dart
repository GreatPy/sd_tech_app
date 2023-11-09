import 'package:flutter/material.dart';
import 'package:sd_tech/data/dummy_pg.dart';
import 'package:sd_tech/models/exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/exam_box/costumer_infos.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_type.dart';
import 'package:sd_tech/widgets/generals/exam_box/payement_status.dart';

class ExamBox extends StatefulWidget {
  const ExamBox({
    super.key,
    required this.exam,
  });
  final Exam exam;

  @override
  State<ExamBox> createState() => _ExamBoxState();
}

class _ExamBoxState extends State<ExamBox> {
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
                const ExamType(),
                const SizedBox(width: 8),
                Expanded(child: CostumerInfos(exam: widget.exam)),
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
                const PayementStatus(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
