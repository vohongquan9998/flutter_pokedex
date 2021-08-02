import 'package:flutter/material.dart';
import 'package:flutter_pokedex/contrant/contrant.dart';
import 'package:flutter_pokedex/provider/api_provider.dart';
import 'package:flutter_pokedex/src/detailpage.dart';
import 'package:flutter_pokedex/widget/cardWidget.dart';
import 'package:flutter_pokedex/widget/statWidget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PokeCard extends StatelessWidget {
  final dynamic poke;
  final BuildContext context;
  final bool isSearch;

  PokeCard(this.poke, this.context, this.isSearch);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(PokeDetail.routeName, arguments: poke.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
          margin: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5),
          decoration: BoxDecoration(
              color: cardColors(poke.type1.toString()),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60)),
              boxShadow: [
                BoxShadow(
                  color: cardColors(poke.type1.toString()).withOpacity(.5),
                  blurRadius: 5,
                  offset: Offset(2, 3),
                ),
              ]),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -50,
                left: -50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Container(
                      width: MediaQuery.of(context).size.height * .2,
                      height: MediaQuery.of(context).size.height * .2,
                      color: Colors.white,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#' + poke.id.toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  Row(
                    children: [
                      Text(
                        toBeginningOfSentenceCase(poke.name),
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (poke.type1 != null)
                        CardTypeWidget(
                          type: poke.type1,
                        ),
                      SizedBox(
                        width: 5,
                      ),
                      if (poke.type2 != null)
                        CardTypeWidget(
                          type: poke.type2,
                        ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: -50,
                bottom: !isSearch
                    ? MediaQuery.of(context).size.height * .15
                    : -MediaQuery.of(context).size.height * .05,
                child: Column(
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/pokeLoad.gif',
                      image: poke.sprite,
                      imageScale: .25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
