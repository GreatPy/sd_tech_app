import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/widgets/generals/Footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: Header(screen: Screen.filters),
        body: Body(
          content: Center(child: Text("FILTRES")),
          footer: Footer(icons: [Screen.planning]),
        ));
  }
}
