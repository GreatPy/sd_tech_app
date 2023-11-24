class Methods {
  Methods();

  //TIME

  DateTime today = DateTime.now();

  DateTime getPastRelativeDate(int days, int hour) {
    return today.subtract(Duration(days: days, hours: hour));
  }

  DateTime getFuturRelativeDate(int days, int hour) {
    return today.add(Duration(days: days, hours: hour));
  }

  //FORM VALIDATION

  String? notEmptyStringValidator(String? value) {
    if (value.toString().isEmpty) {
      return "le prénom de peut pas être un champs vide";
    }
    if (RegExp(r'[^a-zA-Z éèêëîïàâäàôöûü-]').hasMatch(value!)) {
      return "ce champs ne peut comporter que des lettres";
    } else {
      return null;
    }
  }

  String? stringValidator(String? value) {
    if (RegExp(r'[^a-zA-Z éèêëîïàâäàôöûü-]').hasMatch(value!)) {
      return "ce champs ne peut comporter que des lettres";
    } else {
      return null;
    }
  }

  String? onlyNumbersValidator(String? value) {
    if (value.toString().isNotEmpty) {
      if (RegExp(r'^(?!(\d{2,3})$).*$').hasMatch(value!)) {
        return "ce champs doit comporter entre 2 et 3 chiffres";
      } else {
        return null;
      }
    }
    return null;
  }

  String? timeValidator(String? value) {
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

  String? phoneNumberValidator(String? value) {
    if (RegExp(r'[^0-9 +]').hasMatch(value!)) {
      return "ce champs ne peut comporter que des chiffres";
    } else {
      return null;
    }
  }

  String? mailValidator(String? value) {
    if (RegExp(r'^((?!\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b).)*$')
        .hasMatch(value!)) {
      return "ce champs ne peut comporter un mail valide";
    } else {
      return null;
    }
  }

  String? birthdateValidator(String? value) {
    if (RegExp(r'^(?!(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[0-2])/(\d{4})$).*$')
        .hasMatch(value!)) {
      return "ce champs doit être au format JJ/MM/AAAA";
    } else {
      return null;
    }
  }

  String? nirValidator(String? value) {
    if (value.toString().isNotEmpty) {
      String trimedValue = value!.replaceAll(RegExp(r'\s'), '');
      if (RegExp(r'^(?!(\d*)$).*$').hasMatch(trimedValue)) {
        return "ce champs ne doit contenir que des chiffres";
      }
      if (RegExp(r'^(?!(\d{15})$).*$').hasMatch(trimedValue)) {
        return "ce champs doit comporter 15 chiffres";
      } else {
        return null;
      }
    }
    return null;
  }

  String? machinNumberValidator(String? value) {
    if (value.toString().isNotEmpty) {
      if (RegExp(r'^(?!(\d{1,2})$).*$').hasMatch(value!)) {
        return "ce champs doit comporter entre 1 et 2 chiffres";
      } else {
        return null;
      }
    }
    return null;
  }
}
