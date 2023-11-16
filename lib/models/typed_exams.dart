import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:sd_tech/data/dummy_pg.dart';
import 'package:sd_tech/data/dummy_psg.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_box.dart';
import 'package:sd_tech/widgets/generals/exam_box/shift.dart';

class TypedExams {
  const TypedExams();
  //ALL EXAMS
  List<List<TypedExam>> get allTypedExams {
    List<TypedExam> allTypedExams = [];
    for (final pg in pgs) {
      allTypedExams.add(TypedExam(roughExam: pg, type: ExamTypeEnum.pg));
    }
    for (final psg in psgs) {
      allTypedExams.add(TypedExam(roughExam: psg, type: ExamTypeEnum.psg));
    }

    //GROUPS
    Map<DateTime?, List<TypedExam>> groupedByDate = groupBy(allTypedExams,
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
    undatedTypedExams.sort((a, b) =>
        a.first.roughExam.createdAt.compareTo(b.first.roughExam.createdAt));

    //SORTED DATED LIST BY DELIVERY DATE
    datedTypedExams.sort((a, b) => a.first.roughExam.deliveryDate!
        .compareTo(b.first.roughExam.deliveryDate!));

    //CLEAN TYPED EXAMS
    List<List<TypedExam>> cleanTypedExam = [
      undatedTypedExams.first,
      ...datedTypedExams
    ];

    // //START PRINT TEST
    // for (final shift in cleanTypedExam) {
    //   final date = shift.first.roughExam.deliveryDate;
    //   if (date == null) {
    //     print(" >>>>> NO DATES >>>>>");
    //     for (final exam in shift) {
    //       print(
    //           "${exam.roughExam.customer.firstname} created at ${exam.roughExam.createdAt.day}/${exam.roughExam.createdAt.month}/${exam.roughExam.createdAt.year}");
    //     }
    //   }
    //   if (shift.first.roughExam.deliveryDate != null) {
    //     print(" >>>>> SHIFT du ${date!.day} ${date.month} ${date.year} >>>>>");
    //     for (final exam in shift) {
    //       print(
    //           "${exam.roughExam.customer.firstname} : ${exam.roughExam.deliveryDate!.hour}h${exam.roughExam.deliveryDate!.hour}");
    //     }
    //   }
    //   print("================================================");
    // }

    // for (final exam in allTypedExams) {
    //   final examBox = ExamBox(exam: exam);
    //   allExamsBox.add(examBox);
    // }

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
    // print(allExamBoxList);
    return allExamBoxList;
  }

  List<Shift> get allShift {
    List<Shift> allShift = [];
    for (List<ExamBox> shift in allExamBoxList) {
      allShift.add(Shift(examBoxs: shift));
    }
    return allShift;
  }

  Widget get planning {
    return Column(
      children: [...allShift],
    );
  }
}
