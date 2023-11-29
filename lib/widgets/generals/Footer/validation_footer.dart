import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/form_label.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/tech.dart';
import 'package:sd_tech/models/typed_exam.dart';

class ValidationFooter extends StatelessWidget {
  const ValidationFooter({
    super.key,
    this.formKey,
    this.typedExam,
    this.tech,
    this.techProperties,
  });
  final GlobalKey<FormState>? formKey;
  final TypedExam? typedExam;
  final Tech? tech;
  final Map? techProperties;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: neutralLigth,
      height: 92,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: primaryColor),
            onPressed: () {
              formKey!.currentState!.reset();
            },
            child: const Text("annuler"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              if (formKey!.currentState!.validate()) {
                if (tech != null) {
                  print("===================");
                  formKey!.currentState!.save();
                  tech!.firstname = techProperties![FormLabel.firstname.name];
                  tech!.lastname = techProperties![FormLabel.lastname.name];
                  tech!.phone = techProperties![FormLabel.phone.name];
                  tech!.mail = techProperties![FormLabel.mail.name];
                  tech!.address = techProperties![FormLabel.address.name];
                  tech!.pgs = [];
                  tech!.psgs = [];
                }
              } else {
                print("certains champs ne sont pas valides");
              }
            },
            child: const Text("enregister"),
          )
        ],
      ),
    );
  }
}
