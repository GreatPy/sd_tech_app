import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class ExamTypeBox extends StatelessWidget {
  const ExamTypeBox({
    super.key,
    required this.exam,
  });
  final TypedExam exam;

  @override
  Widget build(BuildContext context) {
    String content = exam.type.name.toUpperCase();
    Color color = content == "PG" ? pgColor : Colors.brown.shade200;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: color,
      ),
      height: boxSize,
      width: boxSize,
      child: Center(
          child: StyledText(
        content: content,
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
    );
  }
}
