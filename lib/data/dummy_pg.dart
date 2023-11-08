import 'package:sd_tech/models/exam.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/data/dummy_costumer.dart';

Exam pg1 = Exam(
  id: 1,
  customer: costumer1,
  status: Status.toBeScheduled,
  techId: 1,
  doctorId: 1,
  createdAt: DateTime(2023),
);
