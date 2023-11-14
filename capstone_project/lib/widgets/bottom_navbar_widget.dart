import 'package:capstone_project/screens/artikel/artikel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomnavPage extends StatefulWidget {
  const BottomnavPage({Key? key}) : super(key: key);

  @override
  _BottomnavPageState createState() => _BottomnavPageState();
}

class _BottomnavPageState extends State<BottomnavPage> {
  int _selectedIndex = 0;
  List pages = [
    const ArtikelScreen(),

    // Tambahkan widget route lainnya kek dokter dll....
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.stethoscope),
            label: 'Dokter',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.clockRotateLeft),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.newspaper),
            label: 'Artikel',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
