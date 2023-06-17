import 'package:flutter/material.dart';

import '../utils/dimenstions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  BigText({
    super.key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
  });

  final String text;
  final Color? color;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? Dimenstions.font20 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
