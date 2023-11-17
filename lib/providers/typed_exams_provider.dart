import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sd_tech/models/typed_exams.dart';

final allSigngleTypedExamsProvider =
    Provider((ref) => const TypedExams().allSigngleTypedExams);
