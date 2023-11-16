import 'package:flutter/material.dart';
import 'package:sd_tech/models/typed_exams.dart';
import 'package:sd_tech/widgets/generals/exam_box/shift.dart';

class PlanningContent extends StatelessWidget {
  const PlanningContent({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: const TypedExams().planning);
  }
}
