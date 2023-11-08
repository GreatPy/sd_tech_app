import 'package:flutter/material.dart';

class ScrolableRow extends StatelessWidget {
  const ScrolableRow({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              content,
              maxLines: 1,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
