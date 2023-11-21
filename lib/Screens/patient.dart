import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';

class Patient extends StatefulWidget {
  const Patient({
    super.key,
    required this.costumer,
  });
  final Costumer costumer;
  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    final costumer = widget.costumer;
    return Scaffold(
      appBar: Header(screen: Screen.patient, costumer: costumer),
      body: Body(
        content: Center(
          child: Text(widget.costumer.firstname ?? ""),
        ),
        footer: const Footer(
          icons: [Screen.planning],
          needsDeconexion: false,
          needsValidation: false,
        ),
      ),
    );
  }
}
