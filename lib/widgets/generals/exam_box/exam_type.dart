import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';

class ExamType extends StatelessWidget {
  const ExamType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: pgColor),
      height: 48,
      width: 48,
      child: const Center(child: Text("PG")),
    );
  }
}
