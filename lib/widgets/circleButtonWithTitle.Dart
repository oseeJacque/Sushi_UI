import 'package:flutter/material.dart';
import 'package:flutter_application_ecommerce/src/widgets/circle_button_widget.dart';

class CircleButtonWithTitle extends StatelessWidget {
   CircleButtonWithTitle({Key? key, required this.icon, required this.title}) : super(key: key);

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleButtonWidgets(
        icon,
        ),
        const SizedBox(height: 12),
        Text(title),
      ],
    );
    ;
  }
}