import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';

class Deconexion extends StatelessWidget {
  const Deconexion({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "deconnexion",
          style: TextStyle(color: primaryColorLigth, fontSize: 18),
        ),
      ),
    ));
  }
}
