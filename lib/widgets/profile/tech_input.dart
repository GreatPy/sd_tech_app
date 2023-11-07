import 'package:flutter/material.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/tech.dart';
import 'package:sd_tech/models/enums/label.dart';

class TechInput extends StatefulWidget {
  const TechInput(
      {super.key,
      required this.label,
      required this.tech,
      required this.onFocus});
  final Label label;
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
    String strinLabel = "";
    TextInputType type = TextInputType.text;
    String initialValue = "";
    switch (widget.label) {
      case Label.firstname:
        strinLabel = "prénom";
        type = TextInputType.name;
        initialValue = vahe.firstname;
      case Label.lastname:
        strinLabel = "nom";
        type = TextInputType.name;
        initialValue = vahe.lastname;
      case Label.phone:
        strinLabel = "téléphone";
        type = TextInputType.phone;
        initialValue = vahe.phone;
      case Label.mail:
        strinLabel = "mail";
        type = TextInputType.emailAddress;
        initialValue = vahe.email;
      case Label.address:
        strinLabel = "adresse";
        type = TextInputType.streetAddress;
        initialValue = vahe.address;
      case Label.pg:
        strinLabel = "nombre de PGs";
        type = TextInputType.number;
        initialValue = vahe.pg.toString();
      case Label.psg:
        strinLabel = "nombre de PSGs";
        type = TextInputType.number;
        initialValue = vahe.psg.toString();
    }

    return TextFormField(
      // controller: _inputControler,
      focusNode: _focusNode,
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
