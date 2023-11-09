import 'package:sd_tech/data/dummy_doctor.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/exam.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/data/dummy_costumer.dart';

final DateTime today = DateTime.now();
DateTime getRelativeDate(int days) {
  return today.subtract(Duration(days: days));
}

Exam pg1 = Exam(
  id: 1,
  customer: costumer1,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(239),
);

final List<Exam> pgs = [
  pg1,
];
