import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/screens/signup_screen.dart';

class SignupLocation extends BeamLocation<BeamState> {
  SignupLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    SignupScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('signup'),
        title: 'Signup',
        child: SignupScreen(),
      ),
    ];
    return pages;
  }
}