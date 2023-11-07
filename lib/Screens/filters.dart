import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/enums/status.dart';
import 'package:sd_tech/widgets/filters/filter.dart';
import 'package:sd_tech/widgets/generals/Footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: Header(screen: Screen.filters),
        body: Body(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Filter(label: Status.cancelByHost),
              Filter(label: Status.doesnTWant),
              Filter(label: Status.noShow),
              Filter(label: Status.lateCancelation),
              Filter(label: Status.timelyCancelation),
              Filter(label: Status.conducted),
              Filter(label: Status.scheduled),
              Filter(label: Status.toBeScheduled),
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
