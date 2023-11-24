import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';

class ValidationFooter extends StatelessWidget {
  const ValidationFooter({
    super.key,
    this.formKey,
  });
  final GlobalKey<FormState>? formKey;
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
                formKey!.currentState!.save();
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
