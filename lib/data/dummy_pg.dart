import 'package:sd_tech/data/dummy_doctor.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/data/dummy_costumer.dart';

final DateTime today = DateTime.now();
DateTime getRelativeDate(int days) {
  return today.subtract(Duration(days: days));
}

RoughExam pg1 = RoughExam(
  id: 1,
  customer: costumer1,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(7),
);
RoughExam pg2 = RoughExam(
  id: 2,
  customer: costumer2,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(7),
);
RoughExam pg3 = RoughExam(
  id: 3,
  customer: costumer3,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(18),
);
RoughExam pg4 = RoughExam(
  id: 4,
  customer: costumer4,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(3),
);
RoughExam pg5 = RoughExam(
  id: 5,
  customer: costumer5,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(1),
);

final List<RoughExam> pgs = [
  pg1,
  pg2,
  pg3,
  pg4,
  pg5,
];
