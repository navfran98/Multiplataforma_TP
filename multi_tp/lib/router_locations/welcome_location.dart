import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/screens/welcome_screen.dart';

class WelcomeLocation extends BeamLocation<BeamState> {
  WelcomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    WelcomeScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('welcome'),
        title: 'Welcome',
        child: WelcomeScreen(),
      ),
    ];
    return pages;
  }
}