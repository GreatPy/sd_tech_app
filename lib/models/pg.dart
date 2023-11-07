import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/models/costumer.dart';

class Pg {
  const Pg({
    required this.customer,
    required this.id,
    required this.status,
    required this.createdAt,
    this.techId,
    this.doctorId,
    this.deliveryDate,
    this.note,
    this.access,
    this.bedTime,
    this.wakeUpTime,
  });
  final int id;
  final Costumer customer;
  final Status status;
  final DateTime createdAt;
  final int? techId;
  final int? doctorId;
  final DateTime? deliveryDate;
  final String? note;
  final String? access;
  final String? bedTime;
  final String? wakeUpTime;
}
