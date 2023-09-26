import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/screens/home_screen.dart';
import 'package:multi_tp/presentation/screens/news_screen.dart';
import 'package:multi_tp/presentation/screens/single_news_screen.dart';

class NewsLocation extends BeamLocation<BeamState> {
  NewsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    NewsScreen.route,
    SingleNewsScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('news'),
        title: 'News',
        child: HomeScreen(),
      ),
    ];

    if (state.pathParameters.containsKey('id')) {
      String id = state.pathParameters["id"]!;
      pages.add(
        BeamPage(
          key: ValueKey('news-$id'),
          title: 'News $id',
          child: SingleNewsScreen(id: id),
        ),
      );
    }
    return pages;
  }
}