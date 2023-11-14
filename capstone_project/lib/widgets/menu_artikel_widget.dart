import 'package:flutter/material.dart';

class MenuArtikel extends StatefulWidget {
  const MenuArtikel({Key? key});

  @override
  State<MenuArtikel> createState() => _MenuArtikelState();
}

class _MenuArtikelState extends State<MenuArtikel> {
  final List<String> menuItems = [
    'Terbaru',
    'Kulit & Kelamin',
    'Nutrisi',
    'Gigi & Mulut',
    'Psikiatri',
    'Kardiologi'
  ];
  int selectedMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 8,
        children: List.generate(
          menuItems.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedMenuIndex = index;
              });
            },
            child: Container(
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selectedMenuIndex == index
                      ? Colors.black
                      : const Color(0xFFC4C4C4),
                  width: 1.0, 
                ),
                color: selectedMenuIndex == index
                    ? const Color(0xff008772)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  menuItems[index],
                  style: TextStyle(
                    color: selectedMenuIndex == index
                        ? Colors.black
                        : const Color(0xFFC4C4C4),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                    letterSpacing: 0.10,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
