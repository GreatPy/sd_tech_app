import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/patient_btn_label.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class CostmumerBtn extends StatelessWidget {
  const CostmumerBtn({
    super.key,
    required this.patientBtnLabel,
    required this.typedExam,
  });
  final TypedExam typedExam;
  final PatientBtnLabel patientBtnLabel;
  @override
  Widget build(BuildContext context) {
    late String label;
    late IconData iconData;
    late Widget page;
    switch (patientBtnLabel) {
      case PatientBtnLabel.document:
        label = "Documents";
        iconData = Icons.attach_file_outlined;
        page = const Text("hello");
      case PatientBtnLabel.payment:
        label = "Paiements";
        iconData = Icons.euro_symbol_outlined;
        page = const Text("hello");
      case PatientBtnLabel.schedule:
        label = "Date de livraison";
        iconData = Icons.calendar_today_outlined;
        page = const Text("hello");
      case PatientBtnLabel.status:
        label = "Satut";
        iconData = Icons.sell_outlined;
        page = const Text("hello");
      case PatientBtnLabel.tel:
        label = "Téléphone";
        iconData = Icons.phone_outlined;
        page = const Text("hello");
      case PatientBtnLabel.sms:
        label = "SMS";
        iconData = Icons.local_post_office_outlined;
        page = const Text("hello");
      case PatientBtnLabel.whatsapp:
        label = "Whatsapp";
        iconData = Icons.chat_outlined;
        page = const Text("hello");
      case PatientBtnLabel.gps:
        label = "GPS";
        iconData = Icons.directions_car_outlined;
        page = const Text("hello");
      case PatientBtnLabel.edit:
        label = "Informations patient";
        iconData = Icons.create_outlined;
        page = const Text("hello");
    }
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColorLigth),
            onPressed: () {
              print("hey");
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StyledText(
                    content: label,
                    fontSize: 20,
                  ),
                  Icon(iconData)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
