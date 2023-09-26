import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/screens/user_welcome_screen.dart';

class UserWelcomeLocation extends BeamLocation<BeamState> {
  UserWelcomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    UserWelcomeScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('user welcome'),
        title: 'User Welcome',
        child: UserWelcomeScreen(),
      ),
    ];
    return pages;
  }
}