import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/providers/filters_provider.dart';
import 'package:sd_tech/models/typed_exams.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_box.dart';

class SearchContent extends ConsumerStatefulWidget {
  const SearchContent({super.key});

  @override
  ConsumerState<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends ConsumerState<SearchContent> {
  @override
  Widget build(BuildContext context) {
    final filteredTypedExam = ref.watch(filteredTypedExamsProvider);
    List<ExamBox> examBoxList = [];
    for (TypedExam typedExam in filteredTypedExam) {
      examBoxList.add(ExamBox(exam: typedExam));
    }
    return Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: examBoxList.length, // items is a List
            itemBuilder: (ctx, index) => examBoxList[index]));
  }
}
