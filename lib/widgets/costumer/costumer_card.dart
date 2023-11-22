import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/patient_box_label.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class CostumerCard extends StatefulWidget {
  const CostumerCard({
    super.key,
    required this.roughExam,
    required this.label,
  });
  final RoughExam roughExam;
  final PatientBoxLabel label;

  @override
  State<CostumerCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<CostumerCard> {
  @override
  Widget build(BuildContext context) {
    late final String title;
    late final String? content;
    switch (widget.label) {
      case PatientBoxLabel.notes:
        title = "Notes";
        content = widget.roughExam.notes;
      case PatientBoxLabel.acces:
        title = "Accès";
        content = widget.roughExam.customer.access;
      case PatientBoxLabel.bedTime:
        title = "Horraires d'enregistrement";
        content = """début : ${widget.roughExam.bedTime}
fin : ${widget.roughExam.wakeUpTime}        
durée : ${widget.roughExam.duration} """;
    }
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledText(
                content: title,
                color: primaryColorLigth,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              StyledText(color: neutral, content: content)
            ],
          ),
        ),
      ),
    );
  }
}
