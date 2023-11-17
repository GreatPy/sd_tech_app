import 'package:sd_tech/data/dummy_doctor.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/methods.dart';
import 'package:sd_tech/models/enums/payment_status.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/data/dummy_costumer.dart';

final methods = Methods();

RoughExam pg1 = RoughExam(
  id: 1,
  customer: costumer1,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: methods.getPastRelativeDate(7, 5),
);
RoughExam pg2 = RoughExam(
  id: 2,
  customer: costumer2,
  status: Status.conducted,
  tech: vahe,
  doctor: doctor1,
  createdAt: methods.getPastRelativeDate(8, 8),
  paymentStatus: PaymentStatus.failed,
  deliveryDate: methods.getFuturRelativeDate(0, 2),
);
RoughExam pg3 = RoughExam(
  id: 3,
  customer: costumer3,
  status: Status.scheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: methods.getPastRelativeDate(18, 9),
  deliveryDate: methods.getFuturRelativeDate(32, 5),
);
RoughExam pg4 = RoughExam(
  id: 4,
  customer: costumer4,
  status: Status.toBeScheduled,
  tech: vahe,
  doctor: doctor1,
  createdAt: methods.getPastRelativeDate(3, 9),
);
RoughExam pg5 = RoughExam(
    id: 5,
    customer: costumer5,
    status: Status.scheduled,
    tech: vahe,
    doctor: doctor1,
    createdAt: methods.getPastRelativeDate(1, 4),
    deliveryDate: methods.getFuturRelativeDate(1, 1));

final List<RoughExam> pgs = [
  pg1,
  pg2,
  pg3,
  pg4,
  pg5,
];
