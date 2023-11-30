import 'package:flutter/material.dart';
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
    required this.initalPgs,
    required this.initalPsgs,
    this.resetMachines,
    this.saveMachines,
  });
  final GlobalKey<FormState>? formKey;
  final TypedExam? typedExam;
  final Tech? tech;
  final Map? techProperties;
  final List<String>? initalPgs;
  final List<String>? initalPsgs;
  final void Function()? resetMachines;
  final void Function()? saveMachines;

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
              resetMachines!();
              formKey!.currentState!.reset();
            },
            child: const Text("annuler"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              saveMachines!();
            },
            child: const Text("enregister"),
          )
        ],
      ),
    );
  }
}
