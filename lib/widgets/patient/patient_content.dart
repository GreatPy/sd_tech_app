import 'package:flutter/material.dart';

class PatientContent extends StatefulWidget {
  const PatientContent({super.key});

  @override
  State<PatientContent> createState() => _PatientContentState();
}

class _PatientContentState extends State<PatientContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(color: Colors.blue)),
        Expanded(child: Container(color: Colors.green)),
      ],
    );
  }
}
