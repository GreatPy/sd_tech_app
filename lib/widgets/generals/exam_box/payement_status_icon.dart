import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/payment_status.dart';
import 'package:sd_tech/models/enums/rights.dart';
import 'package:sd_tech/models/styles.dart';

class PaymentStausIcon extends StatelessWidget {
  const PaymentStausIcon({
    super.key,
    required this.rights,
    required this.paymentStatus,
  });
  final Rights? rights;
  final PaymentStatus? paymentStatus;
  @override
  Widget build(BuildContext context) {
    List<Icon> content = [];
    IconData paymentStatusIconData;
    //EURO ICON
    final Icon euroIcon = Icon(
      Icons.euro_outlined,
      color: neutral,
      size: 16,
    );
    switch (paymentStatus) {
      case null:
        paymentStatusIconData = Icons.watch_later_outlined;
      case PaymentStatus.incomplete:
        paymentStatusIconData = Icons.send_outlined;
      case PaymentStatus.failed:
        paymentStatusIconData = Icons.warning_amber_rounded;
      case PaymentStatus.succeeded:
        paymentStatusIconData = Icons.check_circle_outline_outlined;
    }
    content = [euroIcon, Icon(paymentStatusIconData, color: neutral, size: 28)];
    if (rights == Rights.notRequired) {
      paymentStatusIconData = Icons.volunteer_activism_outlined;
      content = [Icon(paymentStatusIconData, color: neutral, size: 28)];
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: content,
    );
  }
}
