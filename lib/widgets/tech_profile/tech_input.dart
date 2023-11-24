import 'package:flutter/material.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/tech.dart';
import 'package:sd_tech/models/enums/form_label.dart';

class TechInput extends StatefulWidget {
  const TechInput(
      {super.key,
      required this.label,
      required this.tech,
      required this.onFocus});
  final FormLabel label;
  final Tech tech;
  final void Function() onFocus;

  @override
  State<TechInput> createState() => _TechInputState();
}

class _TechInputState extends State<TechInput> {
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
    String stringLabel = "";
    TextInputType type = TextInputType.text;
    String initialValue = "";
    String? Function(String?)? validator;
    switch (widget.label) {
      case FormLabel.firstname:
        stringLabel = "prénom";
        type = TextInputType.text;
        initialValue = vahe.firstname;
        validator = (value) {
          return methods.notEmptyStringValidator(value);
        };
      case FormLabel.lastname:
        stringLabel = "nom";
        type = TextInputType.text;
        initialValue = vahe.lastname;
        validator = (value) {
          return methods.notEmptyStringValidator(value);
        };
      case FormLabel.phone:
        stringLabel = "téléphone";
        type = TextInputType.phone;
        initialValue = vahe.phone;
        validator = (value) {
          return methods.phoneNumberValidator(value);
        };
      case FormLabel.mail:
        stringLabel = "mail";
        type = TextInputType.emailAddress;
        initialValue = vahe.mail;
        validator = (value) {
          return methods.mailValidator(value);
        };
      case FormLabel.address:
        stringLabel = "adresse";
        type = TextInputType.streetAddress;
        initialValue = vahe.address;
      case FormLabel.pg:
        stringLabel = "nombre de PGs";
        type = TextInputType.number;
        initialValue = vahe.pgCount.toString();
        validator = (value) {
          return methods.machinNumberValidator(value);
        };
      case FormLabel.psg:
        stringLabel = "nombre de PSGs";
        type = TextInputType.number;
        initialValue = vahe.psgCount.toString();
        validator = (value) {
          return methods.machinNumberValidator(value);
        };
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
        label: Text(stringLabel),
        labelStyle: TextStyle(color: primaryColorLigth),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryColorLigth),
        ),
      ),
      keyboardType: type,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      onSaved: (newValue) {
        print("$stringLabel : $newValue");
      },
    );
  }
}
