import 'package:flutter/material.dart';
import 'package:flutter_pokedex/contrant/contrant.dart';
import 'package:flutter_pokedex/model/pokemon.dart';
import 'package:flutter_pokedex/provider/api_provider.dart';
import 'package:flutter_pokedex/widget/aboutWidget.dart';
import 'package:flutter_pokedex/widget/cardWidget.dart';
import 'package:flutter_pokedex/widget/errorWidget.dart';
import 'package:flutter_pokedex/widget/moveWidget.dart';
import 'package:flutter_pokedex/widget/statWidget.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class PokeDetail extends StatefulWidget {
  static const routeName = '/pokeDetailPage';
  @override
  _PokeDetailState createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  int selectedIndex = 0;
  var isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      final pokeID = ModalRoute.of(context).settings.arguments as String;
      Provider.of<PokeProvider>(context, listen: false)
          .getPokeData(pokeID)
          .then((_) {});
    }
    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<PokeProvider>(context);
    final pokeData = providerData.poke;
    return Scaffold(
      backgroundColor: providerData.isLoading
          ? Colors.white
          : providerData.isRequestError
              ? Colors.white
              : cardColors(pokeData.type1),
      body: providerData.isLoading
          ? Container(
              height: double.infinity,
              color: Colors.indigo[50],
              child: Center(child: Image.asset('assets/pokeball.gif')))
          : providerData.isRequestError
              ? ErrorWidgetPage()
              : Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 2.5,
                      color: providerData.isLoading
                          ? Colors.white
                          : cardColors(
                              pokeData.type1,
                            ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                        ),
                        Positioned(
                          right: 35,
                          bottom: -50,
                          left: 35,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/pokeLoad.gif',
                            image: pokeData.sprite,
                            imageScale: 0.35,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              toBeginningOfSentenceCase(pokeData.name),
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '#' + pokeData.id.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (pokeData.type1 != null)
                                  CardTypeWidget(
                                    type: pokeData.type1,
                                  ),
                                if (pokeData.type1 != null)
                                  SizedBox(
                                    width: 10,
                                  ),
                                if (pokeData.type2 != null)
                                  CardTypeWidget(
                                    type: pokeData.type2,
                                  ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(25),
                              width: MediaQuery.of(context).size.width,
                              child: FittedBox(
                                child: Text(
                                  pokeData.description,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buttonWidget(pokeData, 'Thông tin', 0),
                                buttonWidget(pokeData, 'Chỉ số', 1),
                                buttonWidget(pokeData, 'Kỹ năng', 2),
                              ],
                            ),
                            selectedIndex == 0
                                ? Expanded(
                                    child: PokeAbout(pokeData),
                                  )
                                : selectedIndex == 1
                                    ? PokeStats(pokeData: pokeData)
                                    : Expanded(
                                        child: PokeMoves(pokeData),
                                      ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
    );
  }

  Widget buttonWidget(Pokemon pokeData, String title, int myIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = myIndex;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .05,
        width: MediaQuery.of(context).size.width * .2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selectedIndex == myIndex
              ? cardColors(pokeData.type1)
              : Colors.transparent,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color:
                    selectedIndex == myIndex ? Colors.black : Colors.grey[400]),
          ),
        ),
      ),
    );
  }
}
