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
  @override
  Widget build(BuildContext context) {
    final String title;
    switch (widget.label) {
      case FilterLabel.cancelByHost:
        title = "annulation SleepDoctor";
      case FilterLabel.doesnTWant:
        title = "ne veut plus";
      case FilterLabel.noShow:
        title = "no show";
      case FilterLabel.lateCancelation:
        title = "annulation après départ";
      case FilterLabel.timelyCancelation:
        title = "annulation avant départ";
      case FilterLabel.conducted:
        title = "éffectué";
      case FilterLabel.scheduled:
        title = "rdv pris";
      case FilterLabel.toBeScheduled:
        title = "à programmer";
    }
    return Column(
      children: [
        SwitchListTile(
          value: true,
          activeColor: primaryColorLigth,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          onChanged: (isChecked) {},
          title: Text(title),
        ),
        Container(height: 4, color: neutralLigth)
      ],
    );
  }
}
