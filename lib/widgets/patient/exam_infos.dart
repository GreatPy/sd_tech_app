import 'package:flutter/material.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_type_box.dart';
import 'package:sd_tech/widgets/generals/exam_box/payement_status_box.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

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
    final DateTime today = DateTime.now();
    String formatedDeliverydate = "";
    int delay = today.difference(widget.typedExam.roughExam.createdAt).inDays;
    final RoughExam roughExam = widget.typedExam.roughExam;
    final DateTime? deliverlyDate = roughExam.deliveryDate;
    if (widget.typedExam.roughExam.deliveryDate != null) {
      formatedDeliverydate = """vendredi
23 Décembre 2023""";
    }
    if (widget.typedExam.roughExam.deliveryDate == null) {
      formatedDeliverydate = """en attente de rdv depuis
3 jours """;
    }
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
              StyledText(
                content: formatedDeliverydate,
                color: neutral,
                fontSize: 16,
              ),
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
