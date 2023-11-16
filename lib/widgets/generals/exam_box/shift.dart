import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_box.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class Shift extends StatefulWidget {
  const Shift({
    super.key,
    required this.examBoxs,
  });
  final List<ExamBox> examBoxs;
  @override
  State<Shift> createState() => _ShiftState();
}

class _ShiftState extends State<Shift> {
  @override
  Widget build(BuildContext context) {
    String content = "SHIFT";
    if (widget.examBoxs[0].exam.roughExam.deliveryDate == null) {
      content = "Non progammés";
    }
    return Column(
      children: [
        const SizedBox(height: 24),
        StyledText(
          content: content,
          color: primaryColorLigth,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [...widget.examBoxs]),
        )
      ],
    );
  }
}
