import 'dart:convert';
import 'dart:math';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/model/card.dart';
import 'package:flutter_pokedex/model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokeProvider with ChangeNotifier {
  bool isLoading;
  bool isRequestError = false;
  List<Pokemon> descList = [];
  List<CardModel> pokeList = [];
  Pokemon poke = Pokemon();

  Future<void> getHomeData() async {
    int pokeNumber = 6;
    List<CardModel> tempList = [];
    isRequestError = false;
    for (int i = 1; i < pokeNumber + 1; i++) {
      int pokeIndex;
      Random rand;
      int min = 1;
      int max = 893;
      rand = new Random();
      pokeIndex = min + rand.nextInt(max - min);
      try {
        isLoading = true;
        Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokeIndex');
        final response = await http.get(url);
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        tempList.add(CardModel.fromJson(responseData));
      } catch (e) {
        throw e;
      }
    }
    if (tempList.length == pokeNumber) {
      pokeList = tempList;
      isLoading = false;
      notifyListeners();
      inspect(pokeList);
    }
  }

  Future<void> getPokeData(String id) async {
    isRequestError = false;
    List<Pokemon> tmpDescList = [];
    Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    Uri secUrl = Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id');
    try {
      isLoading = true;
      final reponse = await http.get(url);
      final secReponse = await http.get(secUrl);
      final responseData = json.decode(reponse.body) as Map<String, dynamic>;
      final secResponseData =
          json.decode(secReponse.body) as Map<String, dynamic>;
      poke = Pokemon.fromJson(responseData, secResponseData);
      descList = tmpDescList;
      isLoading = false;
      notifyListeners();
      inspect(poke);
    } on Exception catch (e) {
      isLoading = false;
      isRequestError = true;
      notifyListeners();
      throw (e);
    }
  }
}
