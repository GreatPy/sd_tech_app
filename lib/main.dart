import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:sd_tech/widgets/generals/Footer/footer.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/Planning/planning_content.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((cb) {
    runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: Header(title: "Planning"),
          body: Body(
            content: PlanningContent(),
            footer: Footer(
              items: ["Profile", "Recherche", "Filtres", "Aujourd'hui"],
            ),
          ),
        ),
      ),
    );
  });
}
