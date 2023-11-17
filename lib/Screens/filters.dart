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
    return const Scaffold(
        appBar: Header(screen: Screen.filters),
        body: Body(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Filter(label: Status.cancelByHost, initialValue: false),
              Filter(label: Status.doesnTWant, initialValue: false),
              Filter(label: Status.noShow, initialValue: false),
              Filter(label: Status.lateCancelation, initialValue: false),
              Filter(label: Status.timelyCancelation, initialValue: false),
              Filter(label: Status.conducted, initialValue: false),
              Filter(label: Status.scheduled, initialValue: true),
              Filter(label: Status.toBeScheduled, initialValue: true),
            ],
          ),
          footer: Footer(
            icons: [Screen.planning],
            needsDeconexion: false,
            needsValidation: false,
          ),
        ));
  }
}
