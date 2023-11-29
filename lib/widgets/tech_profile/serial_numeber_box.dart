import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';

class SerialNumberBox extends StatelessWidget {
  const SerialNumberBox({
    super.key,
    required this.serialNumber,
    required this.deleteMachine,
    required this.machines,
  });
  final String serialNumber;
  final List<String> machines;
  final void Function({required List<String> machines, required String machine})
      deleteMachine;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: neutral,
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 16),
            StyledText(
              content: serialNumber,
              color: neutralLigth,
              fontSize: 20,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  deleteMachine(machine: serialNumber, machines: machines);
                },
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: neutralLigth,
                  size: 32,
                )),
          ],
        ),
      ),
    );
  }
}
