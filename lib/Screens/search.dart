import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/widgets/generals/Footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: Header(screen: Screen.searche),
        body: Body(
          content: Center(child: Text("RECHERCHE")),
          footer: Footer(
            icons: [Screen.planning],
          ),
        ));
  }
}
