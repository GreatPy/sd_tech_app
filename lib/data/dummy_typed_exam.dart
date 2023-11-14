import 'package:sd_tech/data/dummy_pg.dart';
import 'package:sd_tech/data/dummy_psg.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';

TypedExam typedExam1 = TypedExam(roughExam: pg1, type: ExamTypeEnum.pg);
TypedExam typedExam2 = TypedExam(roughExam: pg2, type: ExamTypeEnum.pg);
TypedExam typedExam3 = TypedExam(roughExam: pg3, type: ExamTypeEnum.pg);
TypedExam typedExam4 = TypedExam(roughExam: pg4, type: ExamTypeEnum.pg);
TypedExam typedExam5 = TypedExam(roughExam: pg5, type: ExamTypeEnum.pg);
TypedExam typedExam6 = TypedExam(roughExam: psg1, type: ExamTypeEnum.psg);
TypedExam typedExam7 = TypedExam(roughExam: psg2, type: ExamTypeEnum.psg);

final List<TypedExam> typedExams = [
  typedExam1,
  typedExam2,
  typedExam3,
  typedExam4,
  typedExam5,
  typedExam6,
  typedExam7,
];
