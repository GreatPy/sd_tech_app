import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/exam_costumer_info_line.dart';
import 'package:sd_tech/models/exam.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class ScrolableRow extends StatelessWidget {
  const ScrolableRow({
    super.key,
    required this.line,
    required this.exam,
  });
  final ExamCostuerInfoLine line;
  final Exam exam;

  @override
  Widget build(BuildContext context) {
    final Widget content;
    switch (line) {
      case ExamCostuerInfoLine.fullName:
        content = Row(children: [
          StyledText(content: exam.customer.firstname),
          const SizedBox(width: 8),
          StyledText(content: exam.customer.lastname)
        ]);
      case ExamCostuerInfoLine.city:
        content = StyledText(content: exam.customer.city);
      case ExamCostuerInfoLine.delay:
        content = const StyledText(content: "4 jours");
      default:
        content = const Placeholder();
    }
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: content,
          ),
        ),
      ],
    );
  }
}
