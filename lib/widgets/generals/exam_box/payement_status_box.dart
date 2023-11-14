import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/rights.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';

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
    IconData iconData = Icons.euro;
    Color boxColor = neutralLigth;
    if (widget.exam.customer.rights == Rights.notRequired) {
      iconData = Icons.volunteer_activism_outlined;
      boxColor = paymentSuccessColors;
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: boxColor),
      height: boxSize,
      width: boxSize,
      child: Center(
          child: Icon(
        iconData,
        color: neutral,
      )),
    );
  }
}
