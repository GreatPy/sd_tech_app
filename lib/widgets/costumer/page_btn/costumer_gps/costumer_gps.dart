import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/widgets/costumer/page_btn/costumer_gps/costumer_gps_content.dart';
import 'package:sd_tech/widgets/generals/header.dart';

class GpsScreen extends StatelessWidget {
  const GpsScreen({
    super.key,
    required this.roughExam,
  });
  final RoughExam roughExam;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(screen: Screen.costumerGgs),
      body: GpsContent(
        roughExam: roughExam,
      ),
    );
  }
}
