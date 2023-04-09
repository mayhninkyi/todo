import 'package:flutter/material.dart';
import 'package:todo/utils/constant.dart';
import 'package:todo/utils/util.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 120,
          height: 45,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
              child: Text(
            title,
            style: kTextStyleWhite(18),
          ))),
    );
  }
}
