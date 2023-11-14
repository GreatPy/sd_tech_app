import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/widgets/generals/exam_box/exam_type.dart';

class TypedExam {
  const TypedExam({
    required this.exam,
    required this.type,
  });
  final RoughExam exam;
  final ExamType type;
}
