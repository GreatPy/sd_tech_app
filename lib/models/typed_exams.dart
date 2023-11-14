import 'package:sd_tech/data/dummy_pg.dart';
import 'package:sd_tech/data/dummy_psg.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';
import 'package:sd_tech/models/typed_exam.dart';

class TypedExams {
  const TypedExams();
  List<TypedExam> get typedExams {
    List<TypedExam> typedExams = [];
    for (final pg in pgs) {
      typedExams.add(TypedExam(roughExam: pg, type: ExamTypeEnum.pg));
    }
    for (final psg in psgs) {
      typedExams.add(TypedExam(roughExam: psg, type: ExamTypeEnum.psg));
    }
    return typedExams;
  }
}
