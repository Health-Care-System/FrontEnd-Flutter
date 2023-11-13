import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class InputBoxWidget extends StatelessWidget {
  final TextEditingController? controller;
  const InputBoxWidget({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffE3E3E3),
      ),
      child: TextField(
        maxLength: 1,
        controller: controller,
        keyboardType: TextInputType.number,
        style:
            ThemeTextStyle().hadlineSmall.copyWith(fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration:
            const InputDecoration(counterText: '', border: InputBorder.none),
      ),
    );
  }
}
