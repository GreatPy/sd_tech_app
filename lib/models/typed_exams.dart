import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:sd_tech/data/dummy_pg.dart';
import 'package:sd_tech/data/dummy_psg.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_box.dart';
import 'package:sd_tech/widgets/generals/exam_box/shift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sd_tech/providers/filters_provider.dart';

class TypedExams {
  const TypedExams();
//ALL SINGLE EXAMS
  List<TypedExam> get allSigngleTypedExams {
    List<TypedExam> allSigngleTypedExams = [];
    for (final pg in pgs) {
      allSigngleTypedExams.add(TypedExam(roughExam: pg, type: ExamTypeEnum.pg));
    }
    for (final psg in psgs) {
      allSigngleTypedExams
          .add(TypedExam(roughExam: psg, type: ExamTypeEnum.psg));
    }
    return allSigngleTypedExams;
  }

  //ALL EXAMS
  List<List<TypedExam>> get allTypedExams {
    //GROUPS
    Map<DateTime?, List<TypedExam>> groupedByDate = groupBy(
        allSigngleTypedExams,
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
    undatedTypedExams.first
        .sort((a, b) => a.roughExam.createdAt.compareTo(b.roughExam.createdAt));

    //SORTED DATED LIST BY DELIVERY DATE
    datedTypedExams.sort((a, b) => a.first.roughExam.deliveryDate!
        .compareTo(b.first.roughExam.deliveryDate!));

    //CLEAN TYPED EXAMS
    List<List<TypedExam>> cleanTypedExam = [
      undatedTypedExams.first,
      ...datedTypedExams
    ];
    return cleanTypedExam;
  }

  // ALL SHIFT
  List<List<ExamBox>> get allExamBoxList {
    List<List<ExamBox>> allExamBoxList = [];
    for (List<TypedExam> shift in allTypedExams) {
      List<ExamBox> examBoxList = [];
      for (TypedExam typedExam in shift) {
        examBoxList.add(ExamBox(exam: typedExam));
      }
      allExamBoxList.add(examBoxList);
    }
    return allExamBoxList;
  }

  // ALL SINGLE EXAMBOX
  List<ExamBox> get allSingleExamBoxList {
    List<ExamBox> allSingleExamBoxList = [];
    for (List<TypedExam> typedExamList in allTypedExams) {
      for (TypedExam typedExam in typedExamList) {
        allSingleExamBoxList.add(ExamBox(exam: typedExam));
      }
    }
    return allSingleExamBoxList;
  }

  List<Shift> get allShift {
    List<Shift> allShift = [];
    for (List<ExamBox> shift in allExamBoxList) {
      allShift.add(Shift(examBoxs: shift));
    }
    return allShift;
  }

  Widget get planning {
    return ListView.builder(
        itemCount: allShift.length, // items is a List
        itemBuilder: (ctx, index) => allShift[index]);
  }

  Widget get search {
    return ListView.builder(
        itemCount: allSingleExamBoxList.length, // items is a List
        itemBuilder: (ctx, index) => allSingleExamBoxList[index]);
  }
}
