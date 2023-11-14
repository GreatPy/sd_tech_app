import 'package:flutter/material.dart';
import 'package:sd_tech/data/dummy_list_typed_exam.dart';

class PlanningContent extends StatelessWidget {
  const PlanningContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyList.length, // items is a List
      itemBuilder: (ctx, index) => dummyList[index],
    );
  }
}
