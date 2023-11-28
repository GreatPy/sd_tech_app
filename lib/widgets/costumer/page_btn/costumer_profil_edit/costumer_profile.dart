import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sd_tech/models/enums/screen.dart';
import 'package:sd_tech/models/enums/form_label.dart';
import 'package:sd_tech/models/rough_exam.dart';
import 'package:sd_tech/widgets/costumer/page_btn/costumer_profil_edit/costumer_input.dart';
import 'package:sd_tech/widgets/generals/footer/footer.dart';
import 'package:sd_tech/widgets/generals/header.dart';
import 'package:sd_tech/widgets/generals/body.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
    required this.roughExam,
  });
  final RoughExam roughExam;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final formKey = GlobalKey<FormState>();
  Footer? footerContent;
  @override
  void initState() {
    super.initState();
    footerContent = Footer(
      icons: const [Screen.planning],
      needsDeconexion: false,
      needsValidation: true,
      formKey: formKey,
    );
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
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
                // formKey: formKey,
              ),
              CostumerInput(
                label: FormLabel.lastname,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.phone,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.mail,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.address,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.city,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.access,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.birthdate,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.nir,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.hight,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.weight,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.bedTime,
                roughExam: widget.roughExam,
                onFocus: toggleFooter,
              ),
              CostumerInput(
                label: FormLabel.wakeUpTime,
                roughExam: widget.roughExam,
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