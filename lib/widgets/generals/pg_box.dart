import 'package:flutter/material.dart';
import 'package:sd_tech/models/costumer.dart';
import 'package:sd_tech/models/doctor.dart';
import 'package:sd_tech/models/tech.dart';

class PgBox extends StatefulWidget {
  const PgBox({
    super.key,
    required this.costumer,
    required this.tech,
    required this.doctor,
  });
  final Costumer costumer;
  final Tech tech;
  final Doctor doctor;

  @override
  State<PgBox> createState() => _PgBoxState();
}

class _PgBoxState extends State<PgBox> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
