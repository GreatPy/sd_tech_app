import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/enums/exam_costumer_info_line.dart';
import 'package:sd_tech/models/styles.dart';
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
  late String time;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting("fr_FR", null);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.exam.roughExam.deliveryDate != null) {
      String hours =
          DateFormat("HH", "fr_FR").format(widget.exam.roughExam.deliveryDate!);
      String minuts =
          DateFormat("mm", "fr_FR").format(widget.exam.roughExam.deliveryDate!);
      time = "${hours}h$minuts";
    }
    final Widget content;
    final DateTime today = DateTime.now();
    Costumer customer = widget.exam.roughExam.customer;
    switch (widget.line) {
      //FULLNAME
      case ExamCostuerInfoLine.fullName:
        content = Row(children: [
          StyledText(content: customer.firstname, color: neutral),
          const SizedBox(width: 8),
          StyledText(content: customer.lastname, color: neutral)
        ]);
      //CITY
      case ExamCostuerInfoLine.city:
        content = StyledText(
          content: customer.city,
          color: neutral,
          fontWeight: FontWeight.w500,
        );
      //DELAY
      case ExamCostuerInfoLine.delay:
        Duration delay = today.difference(widget.exam.roughExam.createdAt);
        content = Row(
          children: [
            StyledText(
              content: delay.inDays.toString(),
              color: neutral,
            ),
            const SizedBox(width: 8),
            StyledText(
              content: delay > const Duration(days: 2) ? "jours" : "jour",
              color: neutral,
            )
          ],
        );
      //TIME
      case ExamCostuerInfoLine.time:
        content = StyledText(
          content: time,
          color: neutral,
          fontSize: 16,
        );
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
