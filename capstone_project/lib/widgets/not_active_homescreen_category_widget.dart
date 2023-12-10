import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

class NotActiveHomeScreenCategoryWidget extends StatelessWidget {
  final Widget iconWidget;
  final String text;
  const NotActiveHomeScreenCategoryWidget({
    super.key,
    required this.iconWidget,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 88,
          padding: EdgeInsets.only(
            right: 8,
            bottom: 6,
            top: 6,
          ),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: ThemeColor().searchBar,
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconWidget,
                const SizedBox(
                  height: 4,
                ),
                Text(text),
              ],
            ),
          ),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                color: ThemeColor().notActiveCategory,
                borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.only(
              bottom: 2,
              right: 2,
              left: 2,
            ),
            child: Text(
              'Segera Hadir',
              style: ThemeTextStyle().labelExtraSmall,
            ),
          ),
          top: 8,
          right: 0,
        )
      ],
    );
  }
}
