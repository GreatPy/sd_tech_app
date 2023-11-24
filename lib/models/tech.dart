class Tech {
  const Tech({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.mail,
    required this.address,
    required this.pgs,
    required this.psgs,
  });
  final int id;
  final String firstname;
  final String lastname;
  final String phone;
  final String mail;
  final String address;
  final List<String> pgs;
  final List<String> psgs;
  int get pgCount => pgs.length;
  int get psgCount => psgs.length;
}
