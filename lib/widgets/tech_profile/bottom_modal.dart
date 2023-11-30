import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/widgets/generals/footer/validation_footer.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: neutralLigth,
        height: 400,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Form(child: TextFormField()),
            ),
            const ValidationFooter(initalPgs: [], initalPsgs: [])
          ],
        ));
    ;
  }
}
