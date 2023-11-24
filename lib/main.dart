import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/Planning/planning_content.dart';

void main() {
  //ORIENTATION LOCK
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((cb) {
    //RIVERPOD
    runApp(const ProviderScope(child: App()));
  });
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //HIDE DEBUG BANER
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Header(screen: Screen.planning),
        body: Body(
          content: PlanningContent(),
          footer: Footer(
            icons: [
              Screen.techProfile,
              Screen.searche,
              Screen.filters,
              Screen.today
            ],
            needsDeconexion: false,
            needsValidation: false,
          ),
        ),
      ),
    );
  }
}
