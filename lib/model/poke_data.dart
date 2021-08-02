import 'package:flutter/cupertino.dart';

class PokeData with ChangeNotifier {
  var mainUrl;
  PokeData({this.mainUrl});

  factory PokeData.getUrl(dynamic json) {
    return PokeData(
      mainUrl: json['url'],
    );
  }
}
