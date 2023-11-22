import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
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
  late String formatedDate;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting("fr_FR", null);
  }

  @override
  Widget build(BuildContext context) {
    DateTime? date = widget.examBoxs.first.exam.roughExam.deliveryDate;
    String content = "";
    if (date == null) {
      content = "Non progammés";
    }
    if (date != null) {
      formatedDate = DateFormat("EEEE dd LLLL yyyy", "fr_FR").format(date);
      // content = "${date.day} / ${date.month} / ${date.year}";
      content = formatedDate;
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
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(children: [...widget.examBoxs]),
        )
      ],
    );
  }
}
