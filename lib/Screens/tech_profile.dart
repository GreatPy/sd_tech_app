import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sd_tech/data/tech.dart';
import 'package:sd_tech/models/enums/exam_type_enum.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/enums/form_label.dart';
import 'package:sd_tech/models/tech.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';
import 'package:sd_tech/widgets/tech_profile/exam_header.dart';
import 'package:sd_tech/widgets/tech_profile/serial_numeber_box.dart';
import 'package:sd_tech/widgets/tech_profile/tech_input.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  Footer? footerContent;
  late Tech tech;
  late Map techProperties;
  late final List<String> initalPgs;
  late final List<String> initalPsgs;
  bool isMachinesSaved = false;
  @override
  void initState() {
    tech = vahe;
    techProperties = {
      FormLabel.firstname.name: tech.firstname,
      FormLabel.lastname.name: tech.lastname,
      FormLabel.phone.name: tech.phone,
      FormLabel.mail.name: tech.mail,
      FormLabel.address.name: tech.address,
      FormLabel.pg.name: tech.pgCount,
      FormLabel.psg.name: tech.psgCount,
    };
    initalPgs = [...tech.pgs];
    initalPsgs = [...tech.psgs];
    footerContent = Footer(
      icons: const [Screen.planning],
      needsDeconexion: true,
      needsValidation: true,
      formKey: _formKey,
      tech: tech,
      techProperties: techProperties,
      initalPgs: initalPgs,
      initalPsgs: initalPsgs,
      resetMachines: resetMachines,
      saveMachines: saveMachines,
      isMachinesSaved: isMachinesSaved,
    );
    super.initState();
  }

  void saveMachines() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isMachinesSaved = true;
      });
      _formKey.currentState!.save();
      tech.firstname = techProperties[FormLabel.firstname.name];
      tech.lastname = techProperties[FormLabel.lastname.name];
      tech.phone = techProperties[FormLabel.phone.name];
      tech.mail = techProperties[FormLabel.mail.name];
      tech.address = techProperties[FormLabel.address.name];
      tech.pgs = tech.pgs;
      tech.psgs = tech.psgs;
    } else {
      print("certains champs ne sont pas valides");
    }
  }

  void deleteMachine(
      {required List<String> machines, required String machine}) {
    setState(() {
      machines.remove(machines[machines.indexOf(machine)]);
    });
  }

  void updateTechProperty({required FormLabel label, String? newValue}) {
    techProperties[label.name] = newValue;
  }

  void resetMachines() {
    setState(() {
      if (!isMachinesSaved!) {
        tech.pgs = [...initalPgs];
        tech.psgs = [...initalPsgs];
      }
    });
  }

  void toggleFooter() {
    setState(() {
      if (footerContent != null) {
        footerContent = null;
        return;
      }
      if (footerContent == null) {
        footerContent = Footer(
          icons: const [Screen.planning],
          needsDeconexion: true,
          needsValidation: true,
          formKey: _formKey,
          tech: tech,
          techProperties: techProperties,
          initalPgs: initalPgs,
          initalPsgs: initalPsgs,
          resetMachines: resetMachines,
          saveMachines: saveMachines,
          isMachinesSaved: isMachinesSaved,
        );
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TechInput(
                label: FormLabel.firstname,
                tech: tech,
                onFocus: toggleFooter,
                updateTechProperty: updateTechProperty,
              ),
              TechInput(
                label: FormLabel.lastname,
                tech: tech,
                onFocus: toggleFooter,
                updateTechProperty: updateTechProperty,
              ),
              TechInput(
                label: FormLabel.phone,
                tech: tech,
                onFocus: toggleFooter,
                updateTechProperty: updateTechProperty,
              ),
              TechInput(
                label: FormLabel.mail,
                tech: tech,
                onFocus: toggleFooter,
                updateTechProperty: updateTechProperty,
              ),
              TechInput(
                label: FormLabel.address,
                tech: tech,
                onFocus: toggleFooter,
                updateTechProperty: updateTechProperty,
              ),
              const SizedBox(height: 12),
              ExamHeader(
                examType: ExamTypeEnum.pg,
                tech: tech,
                onFocus: toggleFooter,
              ),
              for (final pg in tech.pgs)
                SerialNumberBox(
                  serialNumber: pg,
                  machines: tech.pgs,
                  deleteMachine: deleteMachine,
                ),
              const SizedBox(height: 32),
              ExamHeader(
                examType: ExamTypeEnum.psg,
                tech: tech,
                onFocus: toggleFooter,
              ),
              for (final psg in tech.psgs)
                SerialNumberBox(
                  serialNumber: psg,
                  machines: tech.psgs,
                  deleteMachine: deleteMachine,
                )
            ],
          ),
        ),
      ),
    );

    return KeyboardDismisser(
      gestures: const [GestureType.onVerticalDragDown],
      child: GestureDetector(
        child: Scaffold(
          appBar: const Header(
            screen: Screen.techProfile,
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
