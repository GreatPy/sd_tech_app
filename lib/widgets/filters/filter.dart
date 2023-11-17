import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/providers/filters_provider.dart';
import 'package:sd_tech/providers/typed_exams_provider.dart';

class Filter extends ConsumerStatefulWidget {
  const Filter({
    super.key,
    required this.label,
    required this.initialValue,
  });
  final Status label;
  final bool initialValue;

  @override
  ConsumerState<Filter> createState() => _FilterState();
}

class _FilterState extends ConsumerState<Filter> {
  @override
  Widget build(BuildContext context) {
    Status filter = widget.label;
    //START TEST
    final exams = ref.read(allSigngleTypedExamsProvider);
    //END TEST
    final activFilters = ref.watch(filtersProvider);
    final String title;
    final IconData iconData;

    switch (widget.label) {
      case Status.cancelByHost:
        title = "annulation SleepDoctor";
        iconData = Icons.build_circle_outlined;

      case Status.doesnTWant:
        title = "ne veut plus";
        iconData = Icons.back_hand_outlined;

      case Status.noShow:
        title = "no show";
        iconData = Icons.cancel_outlined;

      case Status.lateCancelation:
        title = "annulation après départ";
        iconData = Icons.alarm_off_outlined;

      case Status.timelyCancelation:
        title = "annulation avant départ";
        iconData = Icons.alarm_on_outlined;

      case Status.conducted:
        title = "éffectué";
        iconData = Icons.check_circle_outline_outlined;

      case Status.scheduled:
        title = "rdv pris";
        iconData = Icons.date_range_outlined;

      case Status.toBeScheduled:
        title = "à programmer";
        iconData = Icons.hourglass_empty_outlined;
    }

    return Column(
      children: [
        SwitchListTile(
          value: activFilters[filter]!,
          onChanged: (isChecked) {
            //START TEST
            print(activFilters);
            for (final exam in exams) {
              print(exams[exams.indexOf(exam)].roughExam.customer.firstname);
            }
            //END TEST
            ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
          },
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
