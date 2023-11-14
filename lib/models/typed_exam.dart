import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_type_box.dart';

class TypedExam {
  const TypedExam({
    required this.roughExam,
    required this.type,
  });
  final RoughExam roughExam;
  final ExamTypeBox type;
}
