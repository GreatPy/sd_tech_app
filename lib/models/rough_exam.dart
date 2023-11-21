import 'package:sd_tech/models/doctor.dart';
import 'package:sd_tech/models/enums/payment_status.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/methods.dart';
import 'package:sd_tech/models/tech.dart';

final methods = Methods();

class RoughExam {
  const RoughExam({
    required this.customer,
    required this.id,
    required this.status,
    required this.createdAt,
    this.tech,
    this.doctor,
    this.deliveryDate,
    this.notes,
    this.bedTimeHours,
    this.bedTimeMinuts,
    this.wakeUpTimeHours,
    this.wakeUpTimeMinuts,
    this.paymentStatus,
  });
  final int id;
  final Costumer customer;
  final Status status;
  final DateTime createdAt;
  final Tech? tech;
  final Doctor? doctor;
  final DateTime? deliveryDate;
  final String? notes;
  final String? bedTimeHours;
  final String? bedTimeMinuts;
  final String? wakeUpTimeHours;
  final String? wakeUpTimeMinuts;
  final PaymentStatus? paymentStatus;
  DateTime? get deliveryDay {
    if (deliveryDate != null) {
      return DateTime(
          deliveryDate!.year, deliveryDate!.month, deliveryDate!.day);
    }
    return null;
  }

  String get bedTime {
    if (bedTimeHours != null && bedTimeHours != null) {
      String formtedTime = "${bedTimeHours}h$bedTimeMinuts";
      return formtedTime;
    }
    return "";
  }

  String get wakeUpTime {
    if (wakeUpTimeHours != null && wakeUpTimeMinuts != null) {
      String formtedTime = "${wakeUpTimeHours}h$wakeUpTimeMinuts";
      return formtedTime;
    }
    return "";
  }

  String get duration {
    if (bedTimeHours != null &&
        bedTimeMinuts != null &&
        wakeUpTimeHours != null &&
        wakeUpTimeMinuts != null) {
      int startHours = int.tryParse(bedTimeHours!)!;
      int startMinuts = int.tryParse(bedTimeMinuts!)!;
      int endHours = int.tryParse(wakeUpTimeHours!)!;
      int endMinuts = int.tryParse(wakeUpTimeMinuts!)!;
      //TODAT AND TOMORROW
      DateTime today = DateTime.now();
      DateTime tomorrow = methods.getFuturRelativeDate(1, 0);
      //DATETIME
      DateTime bedTime =
          DateTime(today.year, today.month, today.day, startHours, startMinuts);
      DateTime wakeUpTime = DateTime(
          tomorrow.year, tomorrow.month, tomorrow.day, endHours, endMinuts);
      //DURATION
      int minDuration = wakeUpTime.difference(bedTime).inMinutes;
      double hoursDuration = minDuration / 60;
      double minutsDuration = minDuration % 60;

      return "${hoursDuration.floor()}h${minutsDuration.floor()}";
    }
    return "";
  }
}
