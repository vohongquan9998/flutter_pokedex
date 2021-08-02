import 'package:flutter/material.dart';
import 'package:flutter_pokedex/widget/search_bar.dart';

class HomeSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
              child: Text(
                'Tìm kiếm Pokemon dựa vào tên hoặc số thứ tự',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                  color: Colors.white60,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SearchBar(),
            ),
          ],
        ),
      ),
    );
  }
}
