import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/enums/label.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/profile/tech_input.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  Footer? footerContent;
  @override
  void initState() {
    super.initState();
    footerContent = const Footer(
        icons: [Screen.planning], needsDeconexion: true, needsValidation: true);
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
            needsDeconexion: true,
            needsValidation: true);
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TechInput(
                  label: Label.firstname, tech: vahe, onFocus: toggleFooter),
              TechInput(
                  label: Label.lastname, tech: vahe, onFocus: toggleFooter),
              TechInput(label: Label.phone, tech: vahe, onFocus: toggleFooter),
              TechInput(label: Label.mail, tech: vahe, onFocus: toggleFooter),
              TechInput(
                  label: Label.address, tech: vahe, onFocus: toggleFooter),
              TechInput(label: Label.pg, tech: vahe, onFocus: toggleFooter),
              TechInput(label: Label.psg, tech: vahe, onFocus: toggleFooter),
            ],
          ),
        ),
      ),
    );

    return KeyboardDismisser(
      gestures: const [GestureType.onVerticalDragDown],
      child: GestureDetector(
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: const Header(
            screen: Screen.profile,
          ),
          body: Body(
            content: bodyContent,
            footer: footerContent,
          ),
        ),
      ),
    );
  }
}
