
import 'package:flutter/material.dart';

class FormStepperButton extends StatelessWidget {
  final String title;
  final int index;
  final bool isActive;
  final VoidCallback onPressed;

  const FormStepperButton({
    super.key,
    required this.title,
    required this.index,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = isActive
        ? Theme.of(context).textTheme.bodyMedium!
            .copyWith(color:Theme.of(context).colorScheme.onPrimary)
        : Theme.of(context).textTheme.bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.onSurface);

    Color stepIndicatorBorderColor = Theme.of(context).colorScheme.primary;

    Color stepIndicatorColor = Theme.of(context).colorScheme.surface;

    Color onStepIndicatorColor = Theme.of(context).colorScheme.primary;

    Row buttonContent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
            color: stepIndicatorColor,
            border: isActive
                ? null
                : Border.all(
                    color: stepIndicatorBorderColor,
                    width: 1.0,
                  ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              index.toString(),
              style: Theme.of(context).textTheme.titleSmall!
                  .copyWith(color: onStepIndicatorColor),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(title, style: textStyle),
      ],
    );
    if (isActive) {
      return ElevatedButton(onPressed: onPressed, child: buttonContent);
    } else {
      return OutlinedButton(onPressed: onPressed, child: buttonContent);
    }
  }
}
