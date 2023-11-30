import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';
import 'package:sd_tech/models/enums/form_label.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/tech.dart';
import 'package:sd_tech/widgets/generals/styled_text.dart';
import 'package:sd_tech/widgets/tech_profile/tech_input.dart';

class ExamHeader extends StatelessWidget {
  const ExamHeader({
    super.key,
    required this.examType,
    required this.tech,
    required this.onFocus,
  });
  final ExamTypeEnum examType;
  final Tech tech;
  final void Function() onFocus;

  @override
  Widget build(BuildContext context) {
    late String stringMachine;
    late int machineCount;
    late String machineType;
    if (examType == ExamTypeEnum.pg) {
      stringMachine = tech.pgCount > 1 ? "PGs" : "PG";
      machineCount = tech.pgCount;
      machineType = "PG";
    }
    if (examType == ExamTypeEnum.psg) {
      stringMachine = tech.psgCount > 1 ? "PSGs" : "PSG";
      machineCount = tech.psgCount;
      machineType = "PSG";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StyledText(
          content: "$machineCount $stringMachine",
          color: primaryColorLigth,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primaryColorLigth),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: StyledText(
                    content: "ajouter un ${examType.name.toUpperCase()}",
                    color: primaryColorLigth,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  content: Form(
                    child: TechInput(
                      label: FormLabel.serialNumber,
                      tech: tech,
                      onFocus: onFocus,
                      isFocus: true,
                    ),
                  ),
                  actions: [
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: StyledText(
                              content: "annuler",
                              color: primaryColorLigth,
                            )),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColorLigth),
                          child: const StyledText(
                            content: "enregistrer",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            child: StyledText(content: "ajouter un $machineType"))
      ],
    );
  }
}
