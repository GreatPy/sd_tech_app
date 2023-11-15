class Methods {
  Methods();
  DateTime today = DateTime.now();
  DateTime getPastRelativeDate(int days) {
    return today.subtract(Duration(days: days));
  }

  DateTime getFuturRelativeDate(int days) {
    return today.add(Duration(days: days));
  }
}
