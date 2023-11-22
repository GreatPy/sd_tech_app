import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/enums/patient_box_label.dart';
import 'package:sd_tech/models/enums/patient_btn_label.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';
import 'package:sd_tech/widgets/costumer/exam_infos.dart';
import 'package:sd_tech/widgets/costumer/incomplete_costumer_info.dart';
import 'package:sd_tech/widgets/costumer/costumer_btn.dart';
import 'package:sd_tech/widgets/costumer/costumer_card.dart';

class CostumerContent extends StatefulWidget {
  const CostumerContent({
    super.key,
    required this.typedExam,
  });
  final TypedExam typedExam;

  @override
  State<CostumerContent> createState() => _PatientContentState();
}

class _PatientContentState extends State<CostumerContent> {
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
    final Costumer costumer = widget.typedExam.roughExam.customer;
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
    double height = isCostumerProfileIncomplete ? 60 : 0;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
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
            const SizedBox(height: 32),
            IncompleCostumerInfo(hight: height),
            CostumerCard(
              roughExam: widget.typedExam.roughExam,
              label: PatientBoxLabel.notes,
            ),
            CostumerCard(
              roughExam: widget.typedExam.roughExam,
              label: PatientBoxLabel.acces,
            ),
            CostumerCard(
              roughExam: widget.typedExam.roughExam,
              label: PatientBoxLabel.bedTime,
            ),
            const SizedBox(height: 16),
            CostmumerBtn(
                patientBtnLabel: PatientBtnLabel.document,
                typedExam: widget.typedExam),
            CostmumerBtn(
                patientBtnLabel: PatientBtnLabel.payment,
                typedExam: widget.typedExam),
            CostmumerBtn(
                patientBtnLabel: PatientBtnLabel.schedule,
                typedExam: widget.typedExam),
            CostmumerBtn(
                patientBtnLabel: PatientBtnLabel.status,
                typedExam: widget.typedExam),
            CostmumerBtn(
                patientBtnLabel: PatientBtnLabel.tel,
                typedExam: widget.typedExam),
            CostmumerBtn(
                patientBtnLabel: PatientBtnLabel.sms,
                typedExam: widget.typedExam),
            CostmumerBtn(
                patientBtnLabel: PatientBtnLabel.whatsapp,
                typedExam: widget.typedExam),
            CostmumerBtn(
                patientBtnLabel: PatientBtnLabel.gps,
                typedExam: widget.typedExam),
            CostmumerBtn(
                patientBtnLabel: PatientBtnLabel.edit,
                typedExam: widget.typedExam),
          ],
        ),
      ),
    );
  }
}
