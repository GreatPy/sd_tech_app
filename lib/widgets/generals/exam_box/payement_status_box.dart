import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/payment_status.dart';
import 'package:sd_tech/models/enums/rights.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/exam_box/payement_status_icon.dart';

class PayementStatusBox extends StatefulWidget {
  const PayementStatusBox({
    super.key,
    required this.exam,
  });
  final RoughExam exam;

  @override
  State<PayementStatusBox> createState() => _PayementStatusBoxState();
}

class _PayementStatusBoxState extends State<PayementStatusBox> {
  @override
  Widget build(BuildContext context) {
    Color payementSatusBoxColor = neutralLigth;
    if (widget.exam.paymentStatus == PaymentStatus.failed) {
      payementSatusBoxColor = dangerColor;
    }
    if (widget.exam.paymentStatus == PaymentStatus.succeeded) {
      payementSatusBoxColor = paymentSuccessColors;
    }
    if (widget.exam.customer.rights == Rights.notRequired) {
      payementSatusBoxColor = paymentSuccessColors;
    }
    return Container(
      decoration: BoxDecoration(
        color: payementSatusBoxColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      height: boxSize,
      width: boxSize,
      child: Center(
          child: PaymentStausIcon(
              rights: widget.exam.customer.rights,
              paymentStatus: widget.exam.paymentStatus)),
    );
  }
}
