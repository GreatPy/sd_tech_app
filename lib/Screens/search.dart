import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/search/search_content.dart';
import 'package:sd_tech/widgets/search/search_input.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _formKey = GlobalKey<FormState>();
  Footer? footerContent;
  @override
  void initState() {
    super.initState();
    footerContent = const Footer(
        icons: [Screen.planning],
        needsDeconexion: false,
        needsValidation: false);
  }

  void toggleFooter() {
    setState(() {
      if (footerContent != null) {
        footerContent = null;
        return;
      }
      if (footerContent == null) {
        footerContent = const Footer(
            icons: [Screen.planning],
            needsDeconexion: false,
            needsValidation: false);
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onVerticalDragDown],
      child: GestureDetector(
        child: Scaffold(
            appBar: const Header(screen: Screen.searche),
            body: Body(
              content: Column(
                children: [
                  Form(
                      child: SearchInput(
                          onFocus: toggleFooter, formKey: _formKey)),
                  const Expanded(child: SearchContent()),
                ],
              ),
              footer: footerContent,
            )),
      ),
    );
  }
}
