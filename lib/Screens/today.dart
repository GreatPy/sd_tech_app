import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/widgets/generals/Footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: Header(screen: Screen.today),
        body: Body(
          content: Center(child: Text("AUJOIURD'HUI")),
          footer: Footer(
            icons: [Screen.planning],
            isKeyboardDisplayed: false,
          ),
        ));
  }
}
