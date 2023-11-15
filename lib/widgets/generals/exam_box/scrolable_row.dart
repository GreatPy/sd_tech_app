import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/exam_costumer_info_line.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ScrolableRow extends StatefulWidget {
  const ScrolableRow({
    super.key,
    required this.line,
    required this.exam,
  });
  final ExamCostuerInfoLine line;
  final TypedExam exam;

  @override
  State<ScrolableRow> createState() => _ScrolableRowState();
}

class _ScrolableRowState extends State<ScrolableRow> {
  String time = "";
  @override
  void initState() {
    super.initState();
    initializeDateFormatting("fr_FR", null);
    if (widget.exam.roughExam.deliveryDate != null) {
      String hours =
          DateFormat("HH", "fr_FR").format(widget.exam.roughExam.deliveryDate!);
      String minuts =
          DateFormat("mm", "fr_FR").format(widget.exam.roughExam.deliveryDate!);
      time = "${hours}h$minuts";
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget content;
    final DateTime today = DateTime.now();
    switch (widget.line) {
      //FULLNAME
      case ExamCostuerInfoLine.fullName:
        content = Row(children: [
          StyledText(content: widget.exam.roughExam.customer.firstname),
          const SizedBox(width: 8),
          StyledText(content: widget.exam.roughExam.customer.lastname)
        ]);
      //CITY
      case ExamCostuerInfoLine.city:
        content = StyledText(content: widget.exam.roughExam.customer.city);
      //DELAY
      case ExamCostuerInfoLine.delay:
        Duration delay = today.difference(widget.exam.roughExam.createdAt);
        content = Row(
          children: [
            StyledText(content: delay.inDays.toString()),
            const SizedBox(width: 8),
            StyledText(
              content: delay > const Duration(days: 2) ? "jours" : "jour",
            )
          ],
        );
      //TIME
      case ExamCostuerInfoLine.time:
        content = StyledText(content: time);
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
