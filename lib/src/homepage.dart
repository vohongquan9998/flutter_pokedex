import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/provider/api_provider.dart';
import 'package:flutter_pokedex/widget/homeSearchPage.dart';
import 'package:flutter_pokedex/widget/pokeCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokeProvider>(context, listen: false).getHomeData();
  }

  Future<void> refreshData(BuildContext context) async {
    await Provider.of<PokeProvider>(context, listen: false).getHomeData();
  }

  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PokeProvider>(context);
    final pokeData = data.pokeList;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PokeDex',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              isSearch
                  ? Container(
                      height: MediaQuery.of(context).size.width / 2.5,
                      width: MediaQuery.of(context).size.width,
                      child: HomeSearchPage(),
                    )
                  : Container(),
              Expanded(
                child: data.isLoading
                    ? Center(
                        child: Image.asset(
                          'assets/pikachu.gif',
                          width: 200,
                          height: 200,
                        ),
                      )
                    : RefreshIndicator(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: [
                            Row(
                              children: pokeData
                                  .map((item) =>
                                      PokeCard(item, context, isSearch))
                                  .toList(),
                            ),
                          ],
                        ),
                        onRefresh: () => refreshData(context),
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.red,
        items: <Widget>[
          Icon(Icons.search, size: 30),
          Icon(Icons.info, size: 30),
          Icon(Icons.refresh, size: 30),
        ],
        onTap: (i) {
          if (i == 0) {
            setState(() {
              isSearch = !isSearch;
            });
          }
          if (i == 1) {
            return Row(
              children: pokeData
                  .map((item) => PokeCard(item, context, isSearch))
                  .toList(),
            );
          }
          if (i == 2) {
            refreshData(context);
          }
        },
      ),
    );
  }
}
