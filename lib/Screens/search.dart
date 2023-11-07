import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/widgets/generals/Footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: Header(screen: Screen.searche),
        body: Body(
          content: Center(child: Text("RECHERCHE")),
          footer: Footer(
            icons: [Screen.planning],
            needsDeconexion: false,
            needsValidation: false,
          ),
        ));
  }
}
