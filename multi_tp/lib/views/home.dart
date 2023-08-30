import 'package:flutter/material.dart';
import 'package:multi_tp/buttons/cta_button.dart';
import 'package:multi_tp/utils/colors.dart';
import 'package:multi_tp/utils/font.dart';
import 'package:multi_tp/inputs/searchfield.dart';
import 'package:multi_tp/components/volcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = DefaultTabController.of(context);
    return Scaffold(
      backgroundColor: ColorPalette.secondary10,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: ColorPalette.secondary90,
        title: Image.asset(
          'images/Logo_rectangular.png',
          fit: BoxFit.fill,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(52),
          child: Material(
            color: ColorPalette.secondary100,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: ColorPalette.secondary200,
                  border: Border(
                    bottom:
                        BorderSide(width: 3.0, color: ColorPalette.neutral0),
                  )),
              tabs: <Widget>[
                Tab(
                  height: 52,
                  child: Text("Postularse",
                      style: CustomFont.button(ColorPalette.neutral0)),
                ),
                Tab(
                  height: 52,
                  child: Text("Mi Perfil",
                      style: CustomFont.button(ColorPalette.neutral0)),
                ),
                Tab(
                  height: 52,
                  child: Text("Novedades",
                      style: CustomFont.button(ColorPalette.neutral0)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 24),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SearchField(),
                  ListView(
                    children: [
                      ListTile(
                        leading: CtaButton(
                          isTransparent: false,
                          isDisabled: false,
                          text: "hola",
                        ),
                      )
                    ],
                  )
                ],
              )),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomePage()));
}