import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/models/icons_data/status.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/screens/patient.dart';
import 'package:sd_tech/widgets/generals/exam_box/costumer_infos_box.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_type_box.dart';
import 'package:sd_tech/widgets/generals/exam_box/payement_status_box.dart';

class ExamBox extends StatefulWidget {
  const ExamBox({
    super.key,
    required this.exam,
  });
  final TypedExam exam;
  @override
  State<ExamBox> createState() => _TypedExamBoxState();
}

class _TypedExamBoxState extends State<ExamBox> {
  @override
  Widget build(BuildContext context) {
    Costumer costumer = widget.exam.roughExam.customer;
    Status status = widget.exam.roughExam.status;
    IconData statusIconData = toBeScheduledIconData;
    bool isCostumerProfileIncomplete = false;
    if (costumer.firstname == "") isCostumerProfileIncomplete = true;
    if (costumer.lastname == "") isCostumerProfileIncomplete = true;
    if (costumer.phone == "") isCostumerProfileIncomplete = true;
    if (costumer.mail == "") isCostumerProfileIncomplete = true;
    if (costumer.address == "") isCostumerProfileIncomplete = true;
    if (costumer.city == "") isCostumerProfileIncomplete = true;
    if (costumer.birthdate == null) isCostumerProfileIncomplete = true;
    if (costumer.nir == "") isCostumerProfileIncomplete = true;
    if (costumer.hight == null) isCostumerProfileIncomplete = true;
    if (costumer.weight == null) isCostumerProfileIncomplete = true;
    double alertIconSize = isCostumerProfileIncomplete ? 32 : 0;
    switch (status) {
      case Status.cancelByHost:
        statusIconData = cancelByHostIconData;
      case Status.doesnTWant:
        statusIconData = doesntWantIconData;
      case Status.noShow:
        statusIconData = noShowIconData;
      case Status.lateCancelation:
        statusIconData = lateCancelationIconData;
      case Status.timelyCancelation:
        statusIconData = timelyCancelationIconData;
      case Status.conducted:
        statusIconData = conductedIconData;
      case Status.scheduled:
        statusIconData = scheduledIconData;
      case Status.toBeScheduled:
        statusIconData = toBeScheduledIconData;
    }
    return Column(
      children: [
        const SizedBox(height: 4),
        InkWell(
          onDoubleTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Patient(
                          typedExam: widget.exam,
                        )));
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ExamTypeBox(exam: widget.exam),
                  const SizedBox(width: 8),
                  Expanded(child: CostumerInfos(exam: widget.exam)),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.warning_amber_rounded,
                    color: dangerColor,
                    size: alertIconSize,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    statusIconData,
                    size: 32,
                    color: primaryColorLigth,
                  ),
                  const SizedBox(width: 4),
                  PayementStatusBox(exam: widget.exam.roughExam),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
