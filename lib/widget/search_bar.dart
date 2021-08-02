import 'package:flutter/material.dart';
import 'package:flutter_pokedex/src/detailpage.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final textController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        maxLines: 1,
        controller: textController,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey[600]),
          errorText: _validate ? null : null,
          border: InputBorder.none,
          hintText: 'Tìm kiếm Pokemon bạn muốn ?',
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            Navigator.of(context)
                .pushNamed(PokeDetail.routeName, arguments: value);
          }
        },
      ),
    );
  }
}
