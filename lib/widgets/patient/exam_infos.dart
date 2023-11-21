import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_type_box.dart';
import 'package:sd_tech/widgets/generals/exam_box/payement_status_box.dart';

class ExamInfos extends StatefulWidget {
  const ExamInfos({
    super.key,
    required this.typedExam,
  });
  final TypedExam typedExam;

  @override
  State<ExamInfos> createState() => _ExamInfosState();
}

class _ExamInfosState extends State<ExamInfos> {
  @override
  Widget build(BuildContext context) {
    final RoughExam roughExam = widget.typedExam.roughExam;
    final DateTime? deliverlyDate = roughExam.deliveryDate;
    const String formatedDeliverydate = """vendredi
23 Décembre 2023""";
    return Card(
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ExamTypeBox(exam: widget.typedExam),
              ),
              const Text(formatedDeliverydate),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: PayementStatusBox(exam: roughExam),
          ),
        ],
      ),
    );
  }
}
