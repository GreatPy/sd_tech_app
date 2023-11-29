import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/enums/form_label.dart';
import 'package:sd_tech/models/typed_exam.dart';
import 'package:sd_tech/widgets/costumer/page_btn/costumer_profil_edit/costumer_input.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
    required this.typedExam,
  });
  final TypedExam typedExam;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final formKey = GlobalKey<FormState>();
  Footer? footerContent;
  late TypedExam typedExam;
  @override
  void initState() {
    typedExam = widget.typedExam;
    footerContent = Footer(
      icons: const [Screen.planning],
      needsDeconexion: false,
      needsValidation: true,
      formKey: formKey,
    );
    super.initState();
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
          needsDeconexion: false,
          needsValidation: true,
          formKey: formKey,
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
          key: formKey,
          child: Column(
            children: [
              CostumerInput(
                label: FormLabel.firstname,
                typedExam: typedExam,
                onFocus: toggleFooter,
                // formKey: formKey,
              ),
              CostumerInput(
                label: FormLabel.lastname,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.phone,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.mail,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.address,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.city,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.access,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.birthdate,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.nir,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.hight,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.weight,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.bedTime,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.wakeUpTime,
                typedExam: typedExam,
                onFocus: toggleFooter,
              ),
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
            screen: Screen.costumerProfile,
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
