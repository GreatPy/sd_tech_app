import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/filter_label.dart';
import 'package:sd_tech/models/styles.dart';

class Filter extends StatefulWidget {
  const Filter({super.key, required this.label});
  final FilterLabel label;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    final String title;
    final IconData iconData;
    switch (widget.label) {
      case FilterLabel.cancelByHost:
        title = "annulation SleepDoctor";
        iconData = Icons.build_circle_outlined;
      case FilterLabel.doesnTWant:
        title = "ne veut plus";
        iconData = Icons.back_hand_outlined;
      case FilterLabel.noShow:
        title = "no show";
        iconData = Icons.cancel_outlined;
      case FilterLabel.lateCancelation:
        title = "annulation après départ";
        iconData = Icons.alarm_off_outlined;
      case FilterLabel.timelyCancelation:
        title = "annulation avant départ";
        iconData = Icons.alarm_on_outlined;
      case FilterLabel.conducted:
        title = "éffectué";
        iconData = Icons.check_circle_outline_outlined;
      case FilterLabel.scheduled:
        title = "rdv pris";
        iconData = Icons.date_range_outlined;
      case FilterLabel.toBeScheduled:
        title = "à programmer";
        iconData = Icons.hourglass_empty_outlined;
    }
    return Column(
      children: [
        SwitchListTile(
          value: _isChecked,
          onChanged: (isChecked) {
            setState(() {
              _isChecked = isChecked;
            });
          },
          dense: false,
          activeColor: primaryColorLigth,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          secondary: Icon(iconData, color: primaryColorLigth),
          title: Text(title, style: TextStyle(color: neutral, fontSize: 16)),
        ),
        Container(height: 4, color: neutralLigth)
      ],
    );
  }
}
