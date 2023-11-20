import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/providers/filters_provider.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_box.dart';
import 'package:sd_tech/widgets/generals/exam_box/shift.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class PlanningContent extends ConsumerStatefulWidget {
  const PlanningContent({super.key});
  @override
  ConsumerState<PlanningContent> createState() {
    return _PlanningContentState();
  }
}

class _PlanningContentState extends ConsumerState<PlanningContent> {
  @override
  Widget build(BuildContext context) {
    final filteredTypedExam = ref.watch(filteredTypedExamsProvider);
    if (filteredTypedExam.isEmpty) {
      return Center(
          child: StyledText(
        content: "Aucun examen trouvé",
        color: primaryColorLigth,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ));
    }
    Map<DateTime?, List<TypedExam>> groupedByDate = groupBy(filteredTypedExam,
        (TypedExam typedExam) => typedExam.roughExam.deliveryDay);
    List<List<TypedExam>> groupsList = groupedByDate.values.toList();
    List<List<TypedExam>> undatedTypedExams = [];
    List<List<TypedExam>> datedTypedExams = [];

    for (List<TypedExam> group in groupsList) {
      //UNDATED LIST
      if (group.first.roughExam.deliveryDate == null) {
        undatedTypedExams.add(group);
      }

      //DATED LIST
      if (group.first.roughExam.deliveryDate != null) {
        datedTypedExams.add(group);
      }
    }
    //SORTED UNDATED LIST BY CREATEDAT DATE
    if (undatedTypedExams.isNotEmpty) {
      undatedTypedExams.first.sort(
          (a, b) => a.roughExam.createdAt.compareTo(b.roughExam.createdAt));
    }

    //SORTED DATED LIST BY DELIVERY DATE
    if (datedTypedExams.isNotEmpty) {
      datedTypedExams.sort((a, b) => a.first.roughExam.deliveryDate!
          .compareTo(b.first.roughExam.deliveryDate!));
    }

    //CLEAN TYPED EXAMS
    List<List<TypedExam>> allTypedExams = [];
    if (undatedTypedExams.isNotEmpty) {
      allTypedExams.add(undatedTypedExams.first);
    }
    if (datedTypedExams.isNotEmpty) {
      for (List<TypedExam> shift in datedTypedExams) {
        allTypedExams.add(shift);
      }
    }

    //ALL SHIFTS
    List<List<ExamBox>> allExamBoxList = [];
    for (List<TypedExam> shift in allTypedExams) {
      List<ExamBox> examBoxList = [];
      for (TypedExam typedExam in shift) {
        examBoxList.add(ExamBox(exam: typedExam));
      }
      allExamBoxList.add(examBoxList);
    }

    // ALL SINGLE EXAMBOX
    List<ExamBox> allSingleExamBoxList = [];
    for (List<TypedExam> typedExamList in allTypedExams) {
      for (TypedExam typedExam in typedExamList) {
        allSingleExamBoxList.add(ExamBox(exam: typedExam));
      }
    }
    List<Shift> allShift = [];
    for (List<ExamBox> shift in allExamBoxList) {
      allShift.add(Shift(examBoxs: shift));
    }
    return ListView.builder(
        itemCount: allShift.length, // items is a List
        itemBuilder: (ctx, index) => allShift[index]);
  } //END WIDGET
}
