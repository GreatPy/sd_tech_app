import 'package:flutter/material.dart';
import 'package:sd_tech/models/typed_exams.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: const TypedExams().search,
    );
  }
}
