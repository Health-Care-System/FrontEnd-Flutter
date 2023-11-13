import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:flutter/material.dart';

void snackbarBerhasil(BuildContext context) {
  AnimatedSnackBar(
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    builder: (context) {
      return Material(
        elevation: 5,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: 220,
            height: 30,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  'Produk Batal dihapus',
                  style: ThemeTextStyle().bodyMedium,
                ),
              ],
            ),
          ),
        ),
      );
    },
  ).show(context);
}

void snackbarBatal(BuildContext context) {
  AnimatedSnackBar(
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    builder: (context) {
      return Material(
        elevation: 5,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: 220,
            height: 30,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.close,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  'Produk Batal dihapus',
                  style: ThemeTextStyle().bodyMedium,
                ),
              ],
            ),
          ),
        ),
      );
    },
  ).show(context);
}

void snackbarGagal(BuildContext context) {
  AnimatedSnackBar(
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    builder: (context) {
      return Material(
        elevation: 5,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SizedBox(
            width: 220,
            height: 30,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  'Produk Gagal dihapus',
                  style: ThemeTextStyle().bodyMedium,
                ),
              ],
            ),
          ),
        ),
      );
    },
  ).show(context);
}
