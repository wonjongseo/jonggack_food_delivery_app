import 'package:flutter/material.dart';
import 'package:jonggack_food_delivery_app/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimenstions.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimenstions.iconSize24,
        ),
        const SizedBox(width: 5),
        SmallTest(
          text: text,
          color: AppColors.textColor,
        ),
      ],
    );
  }
}
