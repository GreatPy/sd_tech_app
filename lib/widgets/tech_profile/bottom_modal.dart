import 'package:flutter/material.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';
import 'package:sd_tech/widgets/generals/footer/validation_footer.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({
    super.key,
    required this.examType,
  });
  final ExamTypeEnum examType;

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey formKey;
    final String machine = widget.examType == ExamTypeEnum.pg ? "PG" : "PSG";
    return Container(
        color: neutralLigth,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: StyledText(
                content: "ajouter un $machine",
                color: primaryColorLigth,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Form(
                child: TextFormField(
                  autofocus: true,
                ),
              ),
            ),
            const ValidationFooter(initalPgs: [], initalPsgs: [])
          ],
        ));
    ;
  }
}
