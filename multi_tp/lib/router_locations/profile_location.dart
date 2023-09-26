import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/screens/edit_profile.dart';
import 'package:multi_tp/presentation/screens/home_screen.dart';
import 'package:multi_tp/presentation/screens/profile_screen.dart';

class ProfileLocation extends BeamLocation<BeamState> {
  ProfileLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
    ProfileScreen.route,
  ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [
      const BeamPage(
        key: ValueKey('profile'),
        title: 'profile',
        child: HomeScreen(),
      ),
    ];

    if (state.uri.pathSegments.contains('edit')) {
      pages.add(const BeamPage(
          key: ValueKey('edit'),
          title: 'Edit',
          child: EditProfileScreen()));
    }
    return pages;
  }
}