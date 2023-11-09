import 'package:sd_tech/models/doctor.dart';
import 'package:sd_tech/models/enums/payment_status.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/tech.dart';

class Exam {
  const Exam({
    required this.customer,
    required this.id,
    required this.status,
    required this.createdAt,
    this.tech,
    this.doctor,
    this.deliveryDate,
    this.note,
    this.access,
    this.bedTime,
    this.wakeUpTime,
    this.paymentStatus,
  });
  final int id;
  final Costumer customer;
  final Status status;
  final DateTime createdAt;
  final Tech? tech;
  final Doctor? doctor;
  final DateTime? deliveryDate;
  final String? note;
  final String? access;
  final String? bedTime;
  final String? wakeUpTime;
  final PaymentStatus? paymentStatus;
}
