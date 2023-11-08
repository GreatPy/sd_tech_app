import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/Planning/planning_content.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((cb) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: const Header(screen: Screen.planning),
          body: Body(
            today: DateTime.now(),
            content: const PlanningContent(),
            footer: const Footer(
              icons: [
                Screen.profile,
                Screen.searche,
                Screen.filters,
                Screen.today
              ],
              needsDeconexion: false,
              needsValidation: false,
            ),
          ),
        ),
      ),
    );
  });
}
