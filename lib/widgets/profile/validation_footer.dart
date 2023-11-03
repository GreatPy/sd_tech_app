import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';

class ValidationFooter extends StatelessWidget {
  const ValidationFooter({super.key});

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
              print("cancel");
            },
            child: const Text("annuler"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              print("saved");
            },
            child: const Text("enregister"),
          )
        ],
      ),
    );
  }
}
