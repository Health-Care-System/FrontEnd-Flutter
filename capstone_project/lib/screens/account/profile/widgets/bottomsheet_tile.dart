import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class BottomSheetTile extends StatelessWidget {
  final String title;
  final Widget iconLeading;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedTrailing;
  final Color? tileColor;
  final IconData? iconTrailing;

  const BottomSheetTile({
    super.key,
    required this.title,
    required this.iconLeading,
    this.onPressed,
    this.onPressedTrailing,
    this.tileColor,
    this.iconTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: MediaQuery.of(context).size.height * .05,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: tileColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              iconLeading,
              const SizedBox(width: 16),
              Text(
                title,
                style: ThemeTextStyle().titleMedium.copyWith(
                      color: ThemeColor().black,
                    ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onPressedTrailing,
            child: Icon(
              iconTrailing,
              color: ThemeColor().black,
            ),
          )
        ],
      ),
    );
  }
}
