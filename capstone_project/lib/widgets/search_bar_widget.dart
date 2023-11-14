import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Cari Artikel',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: InkWell(
            onTap: () {
              // SAAT MICROFONNYA DITEKAN..
            },
            child: const Icon(Icons.mic_none_rounded),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
