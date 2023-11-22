import 'package:flutter/material.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/enums/tech_form_label.dart';

class CostumerInput extends StatefulWidget {
  const CostumerInput(
      {super.key,
      required this.label,
      required this.roughExam,
      required this.onFocus});
  final TechFormLabel label;
  final RoughExam roughExam;
  final void Function() onFocus;

  @override
  State<CostumerInput> createState() => _TechInputState();
}

class _TechInputState extends State<CostumerInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      widget.onFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    String strinLabel = "";
    String? initialValue = "";
    Costumer costumer = widget.roughExam.customer;
    TextInputType type = TextInputType.text;
    switch (widget.label) {
      case TechFormLabel.firstname:
        strinLabel = "prénom";
        type = TextInputType.name;
        initialValue = costumer.firstname;
      case TechFormLabel.lastname:
        strinLabel = "nom";
        type = TextInputType.name;
        initialValue = costumer.lastname;
      case TechFormLabel.phone:
        strinLabel = "téléphone";
        type = TextInputType.phone;
        initialValue = costumer.phone;
      case TechFormLabel.mail:
        strinLabel = "mail";
        type = TextInputType.emailAddress;
        initialValue = costumer.mail;
      case TechFormLabel.address:
        strinLabel = "adresse";
        type = TextInputType.streetAddress;
        initialValue = vahe.address;
      default:
    }

    return TextFormField(
      // controller: _inputControler,
      focusNode: _focusNode,
      cursorColor: primaryColorLigth,
      cursorWidth: 4,
      style: TextStyle(
        color: neutral,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        label: Text(strinLabel),
        labelStyle: TextStyle(color: primaryColorLigth),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryColorLigth),
        ),
      ),
      keyboardType: type,
      initialValue: initialValue,
    );
  }
}
