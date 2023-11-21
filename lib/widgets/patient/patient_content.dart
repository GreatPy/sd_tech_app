import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';
import 'package:sd_tech/widgets/patient/exam_infos.dart';

class PatientContent extends StatefulWidget {
  const PatientContent({
    super.key,
    required this.typedExam,
  });
  final TypedExam typedExam;

  @override
  State<PatientContent> createState() => _PatientContentState();
}

class _PatientContentState extends State<PatientContent> {
  @override
  Widget build(BuildContext context) {
    late String stringStatus;
    late IconData iconData;
    Status status = widget.typedExam.roughExam.status;
    switch (status) {
      case Status.cancelByHost:
        stringStatus = "annulation SleepDoctor";
        iconData = Icons.build_circle_outlined;

      case Status.doesnTWant:
        stringStatus = "ne veut plus";
        iconData = Icons.back_hand_outlined;

      case Status.noShow:
        stringStatus = "no show";
        iconData = Icons.cancel_outlined;

      case Status.lateCancelation:
        stringStatus = "annulation après départ";
        iconData = Icons.alarm_off_outlined;

      case Status.timelyCancelation:
        stringStatus = "annulation avant départ";
        iconData = Icons.alarm_on_outlined;

      case Status.conducted:
        stringStatus = "éffectué";
        iconData = Icons.check_circle_outline_outlined;

      case Status.scheduled:
        stringStatus = "rdv pris";
        iconData = Icons.date_range_outlined;

      case Status.toBeScheduled:
        stringStatus = "à programmer";
        iconData = Icons.hourglass_empty_outlined;
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StyledText(
                            content: "Status : $stringStatus",
                            color: primaryColorLigth,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          Icon(
                            iconData,
                            color: primaryColorLigth,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ExamInfos(typedExam: widget.typedExam),
            ],
          ),
        ),
      ]),
    );
  }
}
