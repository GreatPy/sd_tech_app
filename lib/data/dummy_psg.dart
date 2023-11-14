import 'package:sd_tech/data/dummy_doctor.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/data/dummy_costumer.dart';

final DateTime today = DateTime.now();
DateTime getRelativeDate(int days) {
  return today.subtract(Duration(days: days));
}

RoughExam psg1 = RoughExam(
  id: 1,
  customer: costumer6,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(239),
);
RoughExam psg2 = RoughExam(
  id: 2,
  customer: costumer7,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(23),
);
RoughExam psg3 = RoughExam(
  id: 1,
  customer: costumer8,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(4),
);

final List<RoughExam> psgs = [
  psg1,
  psg2,
  psg3,
];
