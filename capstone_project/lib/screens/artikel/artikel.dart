import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/widgets/menu_artikel_widget.dart';
import 'package:capstone_project/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ArtikelScreen extends StatefulWidget {
  const ArtikelScreen({Key? key}) : super(key: key);

  @override
  _ArtikelScreenState createState() => _ArtikelScreenState();
}

class _ArtikelScreenState extends State<ArtikelScreen> {
  int selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Artikel',
          style: ThemeTextStyle().titleMedium,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(),
            SizedBox(height: 20),
            MenuArtikel(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
