import 'package:demo_app/widgets/form/stepper_button.dart';
import 'package:flutter/material.dart';

class FormStepperButtonData {
  String title;
  VoidCallback action;

  FormStepperButtonData({
    required this.title,
    required this.action,
  });
}

class FormStepperButtonBar extends StatelessWidget {
  const FormStepperButtonBar({
    super.key,
    required this.activeTabIndex,
    required this.buttonsData,
  });

  final int activeTabIndex;
  final List<FormStepperButtonData> buttonsData;

  @override
  Widget build(BuildContext context) {
    List<FormStepperButton> buttonsBarChildren =
        List<FormStepperButton>.generate(
      buttonsData.length,
      growable: false,
      (index) {
        return FormStepperButton(
          title: buttonsData[index].title,
          index: index + 1,
          isActive: activeTabIndex == (index + 1),
          onPressed: buttonsData[index].action,
        );
      },
    );

    return ButtonBar(
      alignment: MainAxisAlignment.start,
      buttonHeight: 100,
      children: buttonsBarChildren,
    );
  }
}
