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
    String? notEmptyStringValidator(String? value) {
      if (value.toString().isEmpty) {
        return "le prénom de peut pas être un champs vide";
      }
      if (RegExp(r'[^a-zA-Z éèêëîïàâäàôöûü]').hasMatch(value!)) {
        return "ce champs ne peut comporter que des lettres";
      } else {
        return null;
      }
    }

    String? onlyNumbers(String? value) {
      if (value.toString().isNotEmpty) {
        if (RegExp(r'^(?!(\d{2,3})$).*$').hasMatch(value!)) {
          return "ce champs doit comporter entre 2 et 3 chiffres";
        } else {
          return null;
        }
      }
      return null;
    }

    String? time(String? value) {
      if (value.toString().isNotEmpty) {
        if (RegExp(r'^(?!([0-2]?\d:[0-5]\d)$).*$').hasMatch(value!)) {
          return "ce champs doit comporter un horrair valide :     HH:MM";
        }
        if (value.length > 4) {
          if (int.parse(value[1]) > 3) {
            return "horraire invalide";
          }
        } else {
          return null;
        }
      }
      return null;
    }

    switch (widget.label) {
      case FormLabel.firstname:
        stringLabel = "prénom";
        type = TextInputType.text;
        initialValue = costumer.firstname;
        validator = (value) {
          return notEmptyStringValidator(value);
        };
      case FormLabel.lastname:
        stringLabel = "nom";
        type = TextInputType.text;
        initialValue = costumer.lastname;
        validator = (value) {
          return notEmptyStringValidator(value);
        };
      case FormLabel.phone:
        stringLabel = "téléphone";
        type = TextInputType.text;
        initialValue = costumer.phone;
        validator = (value) {
          if (RegExp(r'[^0-9 +]').hasMatch(value!)) {
            return "ce champs ne peut comporter que des chiffres";
          } else {
            return null;
          }
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
          if (RegExp(r'[^a-zA-Z éèêëîïàâäàôöûü]').hasMatch(value!)) {
            return "ce champs ne peut comporter que des lettres";
          } else {
            return null;
          }
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
          if (RegExp(
                  r'^(?!(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[0-2])/(\d{4})$).*$')
              .hasMatch(value!)) {
            return "ce champs doit être au format JJ/MM/AAAA";
          } else {
            return null;
          }
        };
      case FormLabel.nir:
        stringLabel = "n° carte vitale";
        type = TextInputType.datetime;
        initialValue = costumer.nir;
        validator = (value) {
          if (value.toString().isNotEmpty) {
            String trimedValue = value!.replaceAll(RegExp(r'\s'), '');
            if (RegExp(r'^(?!(\d{15})$).*$').hasMatch(trimedValue)) {
              return "ce champs doit comporter 15 chiffres";
            } else {
              return null;
            }
          }
          return null;
        };
      case FormLabel.hight:
        stringLabel = "taille (cm)";
        type = TextInputType.number;
        initialValue = costumer.hight != null ? costumer.hight.toString() : "";
        validator = (value) {
          return onlyNumbers(value);
        };
      case FormLabel.weight:
        stringLabel = "poids (kg)";
        type = TextInputType.number;
        initialValue = costumer.hight != null ? costumer.weight.toString() : "";
        validator = (value) {
          return onlyNumbers(value);
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
          return time(value);
        };
      case FormLabel.wakeUpTime:
        stringLabel = "fin d'enregistrement";
        type = TextInputType.datetime;
        initialValue = widget.roughExam.wakeUpTime.replaceAll("h", ":");
        validator = (value) {
          return time(value);
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
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (newValue) {
        print("$stringLabel : $newValue");
      },
    );
  }
}
