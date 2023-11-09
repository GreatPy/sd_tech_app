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
Exam pg2 = Exam(
  id: 2,
  customer: costumer2,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(23),
);
Exam pg3 = Exam(
  id: 3,
  customer: costumer3,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(18),
);
Exam pg4 = Exam(
  id: 4,
  customer: costumer4,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(3),
);
Exam pg5 = Exam(
  id: 5,
  customer: costumer5,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: getRelativeDate(1),
);

final List<Exam> pgs = [
  pg1,
  pg2,
  pg3,
  pg4,
  pg5,
];
