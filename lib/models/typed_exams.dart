import 'package:sd_tech/data/dummy_pg.dart';
import 'package:sd_tech/data/dummy_psg.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_box.dart';

class TypedExams {
  const TypedExams();
  List<ExamBox> get allTypedExamsBox {
    List<TypedExam> typedExams = [];
    List<ExamBox> allExamsBox = [];
    for (final pg in pgs) {
      typedExams.add(TypedExam(roughExam: pg, type: ExamTypeEnum.pg));
    }
    for (final psg in psgs) {
      typedExams.add(TypedExam(roughExam: psg, type: ExamTypeEnum.psg));
    }
    for (final exam in typedExams) {
      final examBox = ExamBox(exam: exam);
      allExamsBox.add(examBox);
    }
    return allExamsBox;
  }
}
