import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/models/styles.dart';
import 'package:sd_tech/models/enums/form_label.dart';

class CostumerInput extends StatefulWidget {
  const CostumerInput({
    super.key,
    required this.label,
    required this.roughExam,
    required this.onFocus,
    // this.formKey,
  });
  final FormLabel label;
  final RoughExam roughExam;
  final void Function() onFocus;
  // final formKey;

  @override
  State<CostumerInput> createState() => _TechInputState();
}

class _TechInputState extends State<CostumerInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting("fr_FR", null);
    _focusNode.addListener(() {
      widget.onFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    String stringLabel = "";
    String? initialValue = "";
    Costumer costumer = widget.roughExam.customer;
    TextInputType type = TextInputType.text;
    String? Function(String?)? validator;

    switch (widget.label) {
      case FormLabel.firstname:
        stringLabel = "prénom";
        type = TextInputType.text;
        initialValue = costumer.firstname;
        validator = (value) {
          return methods.notEmptyStringValidator(value);
        };
      case FormLabel.lastname:
        stringLabel = "nom";
        type = TextInputType.text;
        initialValue = costumer.lastname;
        validator = (value) {
          return methods.notEmptyStringValidator(value);
        };
      case FormLabel.phone:
        stringLabel = "téléphone";
        type = TextInputType.text;
        initialValue = costumer.phone;
        validator = (value) {
          return methods.phoneNumberValidator(value);
        };
      case FormLabel.mail:
        stringLabel = "mail";
        type = TextInputType.emailAddress;
        initialValue = costumer.mail;
        validator = (value) {
          if (RegExp(
                  r'^((?!\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b).)*$')
              .hasMatch(value!)) {
            return "ce champs doit comporter une adresse mail valide";
          } else {
            return null;
          }
        };
      case FormLabel.address:
        stringLabel = "adresse";
        type = TextInputType.streetAddress;
        initialValue = costumer.address;
      case FormLabel.city:
        stringLabel = "ville";
        type = TextInputType.text;
        initialValue = costumer.city;
        validator = (value) {
          return methods.mailValidator(value);
        };
      case FormLabel.birthdate:
        stringLabel = "date de naissance";
        type = TextInputType.datetime;
        DateTime? birthdate = costumer.birthdate;
        String stringBirthdate = birthdate == null
            ? ""
            : DateFormat("dd/MM/yyyy", "fr_FR").format(birthdate);
        initialValue = stringBirthdate;
        validator = (value) {
          return methods.birthdateValidator(value);
        };
      case FormLabel.nir:
        stringLabel = "n° carte vitale";
        type = TextInputType.datetime;
        initialValue = costumer.nir;
        validator = (value) {
          return methods.nirValidator(value);
        };
      case FormLabel.hight:
        stringLabel = "taille (cm)";
        type = TextInputType.number;
        initialValue = costumer.hight != null ? costumer.hight.toString() : "";
        validator = (value) {
          return methods.onlyNumbersValidator(value);
        };
      case FormLabel.weight:
        stringLabel = "poids (kg)";
        type = TextInputType.number;
        initialValue = costumer.hight != null ? costumer.weight.toString() : "";
        validator = (value) {
          return methods.onlyNumbersValidator(value);
        };
      case FormLabel.access:
        stringLabel = "accès";
        type = TextInputType.streetAddress;
        initialValue = costumer.access;
      case FormLabel.bedTime:
        stringLabel = "début d'enregistrement";
        type = TextInputType.datetime;
        initialValue = widget.roughExam.bedTime.replaceAll("h", ":");
        validator = (value) {
          return methods.timeValidator(value);
        };
      case FormLabel.wakeUpTime:
        stringLabel = "fin d'enregistrement";
        type = TextInputType.datetime;
        initialValue = widget.roughExam.wakeUpTime.replaceAll("h", ":");
        validator = (value) {
          return methods.timeValidator(value);
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
