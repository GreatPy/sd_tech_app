import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sd_tech/models/typed_exams.dart';
import 'package:sd_tech/providers/filters_provider.dart';

class PlanningContent extends ConsumerWidget {
  const PlanningContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTypedExam = ref.watch(filteredTypedExamsProvider);
    print(filteredTypedExam.length);
    for (final typedExam in filteredTypedExam) {
      print(typedExam.roughExam.customer.firstname);
    }
    print("====================");
    return const TypedExams().planning;
  }
}
