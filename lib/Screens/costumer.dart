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
  late TypedExam typedExam;
  @override
  void initState() {
    typedExam = widget.typedExam;
    super.initState();
  }

  void updateTypedExam(TypedExam updatedTypedExam) {
    setState(() {
      typedExam = updatedTypedExam;
      print("data updayed !");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        screen: Screen.patient,
        exam: typedExam,
      ),
      body: Body(
        content: CostumerContent(
          typedExam: typedExam,
          updateTypedExam: updateTypedExam,
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
