import 'package:flutter/material.dart';
import 'package:sd_tech/models/typed_exams.dart';

class PlanningContent extends StatelessWidget {
  const PlanningContent({super.key});
  @override
  Widget build(BuildContext context) {
    return const TypedExams().search;
  }
}
