import 'package:flutter/material.dart';
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
    List<TypedExam> typedExams = [];
    List<ExamBox> allExamsBox = [];
    for (final pg in pgs) {
      typedExams.add(TypedExam(roughExam: pg, type: ExamTypeEnum.pg));
    }
    for (final psg in psgs) {
      typedExams.add(TypedExam(roughExam: psg, type: ExamTypeEnum.psg));
    }
    typedExams
        .sort((a, b) => a.roughExam.createdAt.compareTo(b.roughExam.createdAt));
    for (final exam in typedExams) {
      final examBox = ExamBox(exam: exam);
      allExamsBox.add(examBox);
    }
    return allExamsBox;
  }

  // ALL EXAMBOXS WITH NO DELIVERY DATE
  List<ExamBox> get typedExamWithNoDeliveryDate {
    List<ExamBox> allExamsBox = allTypedExamsBox;
    return allExamsBox
        .where((exam) => exam.exam.roughExam.deliveryDate == null)
        .toList();
  }

  //ALL EXAMBOXS WITH DELIVERY DATE
  List<ExamBox> get typedExamWithDeliveryDate {
    List<ExamBox> allExamsBox = allTypedExamsBox;
    return allExamsBox
        .where((exam) => exam.exam.roughExam.deliveryDate != null)
        .toList();
  }

  //ALL EXAMBOXS SPLITED
  List<List<ExamBox>> get spitedScheduledShift {
    return [];
  }

  // TO BE SCHEDULED SHIFT
  Shift get toBeScheduledShift {
    return Shift(examBoxs: typedExamWithNoDeliveryDate);
  }
}
