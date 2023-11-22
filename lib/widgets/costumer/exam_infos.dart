import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_type_box.dart';
import 'package:sd_tech/widgets/generals/exam_box/payement_status_box.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class ExamInfos extends StatefulWidget {
  const ExamInfos({
    super.key,
    required this.typedExam,
  });
  final TypedExam typedExam;

  @override
  State<ExamInfos> createState() => _ExamInfosState();
}

class _ExamInfosState extends State<ExamInfos> {
  String time = "";
  @override
  void initState() {
    super.initState();
    initializeDateFormatting("fr_FR", null);
  }

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    late String daysDelay;
    Duration delay = today.difference(widget.typedExam.roughExam.createdAt);
    DateTime? date = widget.typedExam.roughExam.deliveryDate;
    String content = "";
    if (date == null) {
      daysDelay = delay > const Duration(days: 2) ? "jours" : "jour";
      content = """en attente de rdv depuis
${delay.inDays.toString()} $daysDelay""";
    }
    if (date != null) {
      if (widget.typedExam.roughExam.deliveryDate != null) {
        String hours = DateFormat("HH", "fr_FR")
            .format(widget.typedExam.roughExam.deliveryDate!);
        String minuts = DateFormat("mm", "fr_FR")
            .format(widget.typedExam.roughExam.deliveryDate!);
        time = "${hours}h$minuts";
      }
      String weekDay = DateFormat("EEEE", "fr_FR").format(date);
      String dateEnd = DateFormat("dd LLLL yyyy", "fr_FR").format(date);
      // content = "${date.day} / ${date.month} / ${date.year}";
      content = """$weekDay
$dateEnd
$time""";
    }

    final RoughExam roughExam = widget.typedExam.roughExam;

    return Card(
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: ExamTypeBox(exam: widget.typedExam),
              ),
              StyledText(
                content: content,
                color: neutral,
                fontSize: 16,
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: PayementStatusBox(exam: roughExam),
          ),
        ],
      ),
    );
  }
}
