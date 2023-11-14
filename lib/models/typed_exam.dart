import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';

class TypedExam {
  const TypedExam({
    required this.roughExam,
    required this.type,
  });
  final RoughExam roughExam;
  final ExamTypeEnum type;
}
