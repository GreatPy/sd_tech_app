import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/costumer/costumer_content.dart';

class Patient extends StatefulWidget {
  const Patient({
    super.key,
    required this.typedExam,
  });
  final TypedExam typedExam;
  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(screen: Screen.patient, exam: widget.typedExam),
      body: Body(
        content: CostumerContent(
          typedExam: widget.typedExam,
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
