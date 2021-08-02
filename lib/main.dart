import 'package:flutter/material.dart';
import 'package:flutter_pokedex/provider/api_provider.dart';
import 'package:flutter_pokedex/src/detailpage.dart';
import 'package:flutter_pokedex/src/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          PokeDetail.routeName: (ctx) => PokeDetail(),
        },
      ),
    );
  }
}
