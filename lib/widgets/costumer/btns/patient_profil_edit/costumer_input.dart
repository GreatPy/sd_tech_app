import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/enums/rights.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/enums/form_label.dart';

class CostumerInput extends StatefulWidget {
  const CostumerInput(
      {super.key,
      required this.label,
      required this.roughExam,
      required this.onFocus});
  final FormLabel label;
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
      case FormLabel.firstname:
        strinLabel = "prénom";
        type = TextInputType.name;
        initialValue = costumer.firstname;
      case FormLabel.lastname:
        strinLabel = "nom";
        type = TextInputType.name;
        initialValue = costumer.lastname;
      case FormLabel.phone:
        strinLabel = "téléphone";
        type = TextInputType.phone;
        initialValue = costumer.phone;
      case FormLabel.mail:
        strinLabel = "mail";
        type = TextInputType.emailAddress;
        initialValue = costumer.mail;
      case FormLabel.address:
        strinLabel = "adresse";
        type = TextInputType.streetAddress;
        initialValue = costumer.address;
      case FormLabel.city:
        strinLabel = "ville";
        type = TextInputType.streetAddress;
        initialValue = costumer.city;
      case FormLabel.birthdate:
        strinLabel = "date de naissance";
        type = TextInputType.streetAddress;
        DateTime? birthdate = costumer.birthdate;
        String stringBirthdate = birthdate == null
            ? ""
            : "${birthdate.day}/${birthdate.month}/${birthdate.year}";
        initialValue = stringBirthdate;
      case FormLabel.nir:
        strinLabel = "n° carte vitale";
        type = TextInputType.streetAddress;
        initialValue = costumer.nir;
      case FormLabel.hight:
        strinLabel = "taille";
        type = TextInputType.streetAddress;
        initialValue = costumer.hight.toString();
      case FormLabel.weight:
        strinLabel = "poids";
        type = TextInputType.streetAddress;
        initialValue = costumer.weight.toString();
      case FormLabel.rights:
        strinLabel = "droits";
        type = TextInputType.streetAddress;
        initialValue = "";
        if (costumer.rights == null) {
          initialValue = "";
        }
        if (costumer.rights == Rights.required) {
          initialValue = "1/3 payant requis";
        }
        if (costumer.rights == Rights.notRequired) {
          initialValue = "prise en charge à 100%";
        }
      case FormLabel.access:
        strinLabel = "accès";
        type = TextInputType.streetAddress;
        initialValue = costumer.access;
      case FormLabel.bedTime:
        strinLabel = "début d'enregistrement";
        type = TextInputType.streetAddress;
      case FormLabel.wakeUpTime:
        strinLabel = "fin d'enregistrement";
        type = TextInputType.streetAddress;

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
