import 'package:flutter/material.dart';
import 'package:sd_tech/widgets/generals/Footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: Header(title: "Filtres"),
        body: Body(
          content: Center(child: Text("FILTRES")),
          footer: Footer(items: ["Back"]),
        ));
  }
}
