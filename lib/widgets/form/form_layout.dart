
import 'package:flutter/material.dart';

class ScreenStepperFormLayout extends StatelessWidget {
  const ScreenStepperFormLayout({
    super.key,
    required this.header,
    required this.footer,
    required this.body,
  });

  final Widget header;
  final Widget footer;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              const SizedBox(height: 10),
              Expanded(child: SingleChildScrollView(child: body)),
              const Divider(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: footer,
                ),
              ),
            ],
          ),
        ),
       
       
      ],
    );
  }
}

