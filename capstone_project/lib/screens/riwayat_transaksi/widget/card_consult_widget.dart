import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/constants/color_theme.dart';
import 'package:flutter/material.dart';

class CardConsultProgress extends StatelessWidget {
  const CardConsultProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 23,
                        backgroundImage: AssetImage('assets/images/doctor.png'),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. Putu Shinta Widari Tirka Sp.D.V.E",
                              style: ThemeTextStyle().labelMedium.copyWith(
                                    color: const Color(0xff4e4e4e),
                                  ),
                            ),
                            Text(
                              "Sp. Kulit & Kelamin",
                              style: ThemeTextStyle().labelMedium.copyWith(
                                    color: const Color(0xff4e4e4e),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0.7,
                    child: Container(
                      width: 58,
                      height: 20,
                      decoration: BoxDecoration(
                        color: const Color(0xffFDE880),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'pending',
                          textAlign: TextAlign.center,
                          style: ThemeTextStyle()
                              .labelSmall
                              .copyWith(color: const Color(0xff4E4E4E)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // halaman chat yang sedang berlangsung
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fixedSize: const Size.fromWidth(175.0),
                ).copyWith(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return ThemeColor().primaryButton;
                    },
                  ),
                ),
                child: Text(
                  'Mulai Konsultasi',
                  style: ThemeTextStyle().labelLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
