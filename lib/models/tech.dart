class Tech {
  Tech({
    required this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.mail,
    this.address,
    required this.pgs,
    required this.psgs,
  });
  final int id;
  String? firstname;
  String? lastname;
  String? phone;
  String? mail;
  String? address;
  List<String> pgs;
  List<String> psgs;
  int get pgCount => pgs.length;
  int get psgCount => psgs.length;
}
