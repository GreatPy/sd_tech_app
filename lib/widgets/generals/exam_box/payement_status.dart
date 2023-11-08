import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class PayementStatus extends StatelessWidget {
  const PayementStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: paymentSuccessColors),
      height: boxSize,
      width: boxSize,
      child: Center(
          child: StyledText(
        content: "€",
        color: neutral,
        fontSize: 28,
        fontWeight: FontWeight.w300,
      )),
    );
  }
}
