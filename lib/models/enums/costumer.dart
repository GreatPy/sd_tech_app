class Costumer {
  const Costumer({
    this.firstname,
    this.lastname,
    this.phone,
    this.mail,
    this.address,
    required this.id,
  });
  final int id;
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? mail;
  final String? address;
}
