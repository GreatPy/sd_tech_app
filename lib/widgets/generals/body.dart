import 'package:flutter/material.dart';
import 'package:sd_tech/widgets/generals/Footer/footer.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.content,
    this.footer,
  });
  final Widget content;
  final Footer? footer;

  @override
  Widget build(BuildContext context) {
    if (footer == null) {
      return Column(
        children: [Expanded(child: content)],
      );
    }
    if (footer != null) {
      return Column(
        children: [Expanded(child: content), footer!],
      );
    }
    return const Placeholder();
  }
}
