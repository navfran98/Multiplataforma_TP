import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/screens/home_screen.dart';
import 'package:multi_tp/presentation/screens/single_volunteering_screen.dart';
import 'package:multi_tp/presentation/screens/volunteering_screen.dart';
import 'package:multi_tp/presentation/screens/welcome_screen.dart';

class VolunteeringLocation extends BeamLocation<BeamState> {
  VolunteeringLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    VolunteeringScreen.route,
    SingleVolunteeringScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('volunteering'),
        title: 'Volunteering',
        child: HomeScreen(),
      ),
    ];

    if (state.pathParameters.containsKey('id')) {
      String id = state.pathParameters["id"]!;
      pages.add(
        BeamPage(
          key: ValueKey('volunteering-$id'),
          title: 'Volunteering $id',
          child: SingleVolunteeringScreen(id: id),
        ),
      );
    }
    return pages;
  }
}