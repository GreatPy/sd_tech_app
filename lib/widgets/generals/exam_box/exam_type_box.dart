import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';

class ExamTypeBox extends StatelessWidget {
  const ExamTypeBox({
    super.key,
    required this.examType,
  });
  final ExamTypeEnum examType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: pgColor),
      height: boxSize,
      width: boxSize,
      child: const Center(
          child: StyledText(
        content: "PG",
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
    );
  }
}
