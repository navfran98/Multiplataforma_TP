import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/screens/home_screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    HomeScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('home'),
          title: 'Home',
          child: HomeScreen())
    ];

    return pages;
  }
}