import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/doctor.dart';
import 'package:sd_tech/models/enums/payment_status.dart';
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
    return Card(
      color: neutralMediumLight,
      child: const Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            ExamType(),
            SizedBox(width: 8),
            Expanded(child: CostumerInfos()),
            SizedBox(width: 4),
            Icon(Icons.warning_amber_rounded),
            SizedBox(width: 4),
            Icon(Icons.hourglass_empty_outlined),
            SizedBox(width: 4),
            PayementStatus(),
          ],
        ),
      ),
    );
  }
}
