import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/enums/label.dart';
import 'package:sd_tech/widgets/generals/Footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/profile/input.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    bool isKeyboardDisplayed = true;
    late Footer footer;

    if (!isKeyboardDisplayed) {
      footer = Footer(
        icons: const [Screen.planning],
        isKeyboardDisplayed: isKeyboardDisplayed,
      );
    }
    if (isKeyboardDisplayed) {
      footer = Footer(
        icons: const [Screen.keyboard],
        isKeyboardDisplayed: isKeyboardDisplayed,
      );
    }

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: const Header(
          screen: Screen.profile,
        ),
        body: Body(
          content: const SingleChildScrollView(
              child: Form(
            child: Column(
              children: [
                Input(
                  label: Label.firstname,
                ),
                Input(label: Label.lastname),
                Input(label: Label.phone),
                Input(label: Label.mail),
                Input(label: Label.address),
                Input(label: Label.pg),
                Input(label: Label.psg),
              ],
            ),
          )),
          footer: footer,
        ));
  }
}
