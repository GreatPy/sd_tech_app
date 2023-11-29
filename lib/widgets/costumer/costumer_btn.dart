import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sd_tech/models/enums/patient_btn_label.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class CostmumerBtn extends StatelessWidget {
  const CostmumerBtn({
    super.key,
    required this.patientBtnLabel,
    required this.typedExam,
    required this.page,
    this.updateTypedExam,
    // this.additionnalAction,
  });
  final TypedExam typedExam;
  final PatientBtnLabel patientBtnLabel;
  final Widget page;
  final void Function(TypedExam updatedTypedExam)? updateTypedExam;
  // final void Function()? additionnalAction;
  @override
  Widget build(BuildContext context) {
    void Function()? additionnalAction;
    late String label;
    late IconData iconData;
    switch (patientBtnLabel) {
      case PatientBtnLabel.document:
        label = "Documents";
        iconData = Icons.attach_file_outlined;

      case PatientBtnLabel.payment:
        label = "Paiements";
        iconData = Icons.euro_symbol_outlined;

      case PatientBtnLabel.schedule:
        label = "Date de livraison";
        iconData = Icons.calendar_today_outlined;

      case PatientBtnLabel.status:
        label = "Satut";
        iconData = Icons.sell_outlined;

      case PatientBtnLabel.tel:
        label = "Téléphone";
        iconData = Icons.phone_outlined;

      case PatientBtnLabel.sms:
        label = "SMS";
        iconData = Icons.local_post_office_outlined;

      case PatientBtnLabel.whatsapp:
        label = "Whatsapp";
        iconData = Icons.chat_outlined;

      case PatientBtnLabel.gps:
        label = "GPS";
        iconData = Icons.directions_car_outlined;
        additionnalAction = () {
          final String dataToCopy =
              typedExam.roughExam.customer.address.toString();
          Clipboard.setData(ClipboardData(text: dataToCopy));
          // Vous pouvez ajouter un feedback ou un message pour informer l'utilisateur que la copie a été effectuée.
          // Par exemple : Scaffold.of(context).showSnackBar(SnackBar(content: Text('Donnée copiée dans le presse-papiers')));
          print(dataToCopy);
        };

      case PatientBtnLabel.edit:
        label = "Informations patient";
        iconData = Icons.create_outlined;
    }
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColorLigth),
            onPressed: () {
              if (additionnalAction != null) {
                additionnalAction();
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => page,
                  ));
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
