class Methods {
  Methods();
  DateTime today = DateTime.now();

  DateTime getPastRelativeDate(int days, int hour) {
    return today.subtract(Duration(days: days, hours: hour));
  }

  DateTime getFuturRelativeDate(int days, int hour) {
    return today.add(Duration(days: days, hours: hour));
  }
}
