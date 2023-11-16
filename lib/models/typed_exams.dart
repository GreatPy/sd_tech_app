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
  List<ExamBox> get allTypedExamsBox {
    List<TypedExam> allTypedExams = [];
    List<ExamBox> allExamsBox = [];
    for (final pg in pgs) {
      allTypedExams.add(TypedExam(roughExam: pg, type: ExamTypeEnum.pg));
    }
    for (final psg in psgs) {
      allTypedExams.add(TypedExam(roughExam: psg, type: ExamTypeEnum.psg));
    }
    for (final exam in allTypedExams) {
      final examBox = ExamBox(exam: exam);
      allExamsBox.add(examBox);
    }
    //GROUPS
    Map<DateTime?, List<TypedExam>> groupedByDate = groupBy(allTypedExams,
        (TypedExam typedExam) => typedExam.roughExam.deliveryDay);
    List<List<TypedExam>> groupsList = groupedByDate.values.toList();

    //PRINT TEST
    for (List<TypedExam> group in groupsList) {
      print("SHIFT");
      for (TypedExam typedExam in group) {
        print(
            "${typedExam.roughExam.customer.firstname} : ${typedExam.roughExam.deliveryDay}");
      }
    }
    return allExamsBox;
  }

  // ALL SHIFT
  Shift get allShift {
    return Shift(examBoxs: allTypedExamsBox);
  }
}
