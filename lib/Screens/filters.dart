import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sd_tech/providers/filters_provider.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/widgets/filters/filter.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';

class Filters extends ConsumerWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activFilters = ref.watch(filtersProvider);
    return Scaffold(
        appBar: const Header(screen: Screen.filters),
        body: Body(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Filter(
                  label: Status.cancelByHost,
                  initialValue: activFilters[Status.cancelByHost]!),
              Filter(
                  label: Status.doesnTWant,
                  initialValue: activFilters[Status.doesnTWant]!),
              Filter(
                  label: Status.noShow,
                  initialValue: activFilters[Status.noShow]!),
              Filter(
                  label: Status.lateCancelation,
                  initialValue: activFilters[Status.lateCancelation]!),
              Filter(
                  label: Status.timelyCancelation,
                  initialValue: activFilters[Status.timelyCancelation]!),
              Filter(
                  label: Status.conducted,
                  initialValue: activFilters[Status.conducted]!),
              Filter(
                  label: Status.scheduled,
                  initialValue: activFilters[Status.scheduled]!),
              Filter(
                  label: Status.toBeScheduled,
                  initialValue: activFilters[Status.toBeScheduled]!),
            ],
          ),
          footer: const Footer(
            icons: [Screen.planning],
            needsDeconexion: false,
            needsValidation: false,
          ),
        ));
  }
}
