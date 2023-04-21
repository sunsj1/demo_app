import 'package:flutter/material.dart';

class FormFieldLabel extends StatelessWidget {
  const FormFieldLabel(
    this.text, {
    super.key,
    this.required = false,
  });

  final String text;
  final bool required;

  @override
  Widget build(BuildContext context) {
    if (required) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary)),
            const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Icon(
                Icons.circle,
                color: Colors.red,
                size: 10.0,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(text, style: Theme.of(context).textTheme.labelMedium),
      );
    }
  }
}
