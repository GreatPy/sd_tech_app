import 'package:sd_tech/data/dummy_doctor.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/methods.dart';
import 'package:sd_tech/models/enums/payment_status.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/data/dummy_costumer.dart';

final methods = Methods();

RoughExam psg1 = RoughExam(
  id: 1,
  customer: costumer6,
  status: Status.doesnTWant,
  tech: vahe,
  doctor: doctor1,
  createdAt: methods.getPastRelativeDate(9, 4),
);
RoughExam psg2 = RoughExam(
    id: 2,
    customer: costumer7,
    status: Status.toBeScheduled,
    tech: vahe,
    doctor: doctor1,
    createdAt: methods.getPastRelativeDate(12, 6),
    paymentStatus: PaymentStatus.incomplete);
RoughExam psg3 = RoughExam(
  id: 1,
  customer: costumer8,
  status: Status.conducted,
  tech: vahe,
  doctor: doctor1,
  createdAt: methods.getPastRelativeDate(14, 12),
  paymentStatus: PaymentStatus.succeeded,
  deliveryDate: methods.getFuturRelativeDate(1, 7),
);

final List<RoughExam> psgs = [
  psg1,
  psg2,
  psg3,
];
