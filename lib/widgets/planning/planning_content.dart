import 'package:flutter/material.dart';
import 'package:sd_tech/models/typed_exams.dart';

class PlanningContent extends StatelessWidget {
  const PlanningContent({super.key});

  @override
  Widget build(BuildContext context) {
    const typedExams = TypedExams();
    final theList = typedExams.typedExamWithDeliveryDate;
    return ListView.builder(
      itemCount: theList.length, // items is a List
      itemBuilder: (ctx, index) => theList[index],
    );
  }
}
