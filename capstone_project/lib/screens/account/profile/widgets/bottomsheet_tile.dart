import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetTile extends StatelessWidget {
  final String title;
  final Widget iconLeading;
  final VoidCallback? onTap;
  final IconData? iconTrailing;
  final Color? tileColor;

  const BottomSheetTile({
    super.key,
    required this.title,
    required this.iconLeading,
    this.onTap,
    this.iconTrailing,
    this.tileColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .05,
      child: ListTile(
        onTap: onTap,
        tileColor: tileColor,
        splashColor: ThemeColor().primaryButtonActive.withOpacity(0.3),
        leading: iconLeading,
        title: Text(title),
        titleTextStyle: ThemeTextStyle().titleMedium,
        isThreeLine: false,
        trailing: Icon(
          iconTrailing,
          size: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        iconColor: ThemeColor().black,
        textColor: ThemeColor().black,
        horizontalTitleGap: 16,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      ),
    );
  }
}

class RowTile extends StatelessWidget {
  const RowTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ThemeColor().white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {},
        overlayColor: MaterialStatePropertyAll(Colors.red),
        splashFactory: InkSplash.splashFactory,
        borderRadius: BorderRadius.circular(8),
        // splashColor: Colors.red,
        child: Container(
          height: MediaQuery.of(context).size.height * .05,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.photo),
                  const SizedBox(width: 16),
                  Text(
                    'Ambil Gambar',
                    style: ThemeTextStyle().titleMedium,
                  ),
                ],
              ),
              const Icon(
                Icons.close,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialBottomTile extends StatelessWidget {
  const MaterialBottomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .05,
      child: MaterialButton(onPressed: () {}),
    );
  }
}
