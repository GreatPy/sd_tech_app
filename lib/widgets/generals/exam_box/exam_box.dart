import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/doctor.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/tech.dart';
import 'package:sd_tech/widgets/generals/exam_box/costumer_Infos.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_type.dart';
import 'package:sd_tech/widgets/generals/exam_box/payement_status.dart';

class ExamBox extends StatefulWidget {
  const ExamBox({
    super.key,
    required this.costumer,
    required this.tech,
    required this.doctor,
  });
  final Costumer costumer;
  final Tech tech;
  final Doctor doctor;

  @override
  State<ExamBox> createState() => _ExamBoxState();
}

class _ExamBoxState extends State<ExamBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                const ExamType(),
                const SizedBox(width: 8),
                const Expanded(child: CostumerInfos()),
                const SizedBox(width: 2),
                Icon(
                  Icons.warning_amber_rounded,
                  color: dangerColor,
                  size: 32,
                ),
                const SizedBox(width: 2),
                Icon(
                  Icons.hourglass_empty_outlined,
                  size: 32,
                  color: primaryColorLigth,
                ),
                const SizedBox(width: 2),
                const PayementStatus(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
