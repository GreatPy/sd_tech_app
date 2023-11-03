import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/label.dart';

class Input extends StatefulWidget {
  const Input({
    super.key,
    required this.label,
  });
  final Label label;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    String strinLabel = "";
    TextInputType type = TextInputType.text;
    switch (widget.label) {
      case Label.firstname:
        strinLabel = "prénom";
        type = TextInputType.name;
      case Label.lastname:
        type = TextInputType.name;
      case Label.phone:
        strinLabel = "téléphone";
        type = TextInputType.phone;
      case Label.mail:
        strinLabel = "mail";
        type = TextInputType.emailAddress;
      case Label.address:
        strinLabel = "adresse";
        type = TextInputType.streetAddress;
      case Label.pg:
        strinLabel = "nombre de PGs";
        type = TextInputType.number;
      case Label.psg:
        strinLabel = "nombre de PSGs";
        type = TextInputType.number;
    }

    return TextFormField(
      decoration: InputDecoration(label: Text(strinLabel)),
      keyboardType: type,
      initialValue: "hello",
      onTap: () {},
    );
  }
}
