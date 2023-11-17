import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_tp/presentation/screens/login_screen.dart';
import 'package:multi_tp/presentation/screens/news_screen.dart';
import 'package:multi_tp/presentation/screens/profile_screen.dart';
import 'package:multi_tp/presentation/screens/signup_screen.dart';
import 'package:multi_tp/presentation/screens/user_welcome_screen.dart';
import 'package:multi_tp/presentation/screens/volunteering_screen.dart';
import 'package:multi_tp/presentation/screens/welcome_screen.dart';
import 'package:multi_tp/router_locations/home_location.dart';
import 'package:multi_tp/router_locations/login_location.dart';
import 'package:multi_tp/router_locations/news_location.dart';
import 'package:multi_tp/router_locations/profile_location.dart';
import 'package:multi_tp/router_locations/signup_location.dart';
import 'package:multi_tp/router_locations/user_welcome_location.dart';
import 'package:multi_tp/router_locations/volunteering_location.dart';
import 'package:multi_tp/router_locations/welcome_location.dart';
import 'package:multi_tp/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/router.g.dart';

@Riverpod(keepAlive: true)
Raw<BeamerDelegate> mainBeamerDelegate(MainBeamerDelegateRef ref) =>
    BeamerDelegate(
        initialPath: _getInitialPath(),
        locationBuilder: _locationBuilder,
        guards: [getLoggerGuard()]);

BeamGuard getLoggerGuard() {
  return BeamGuard(
    pathPatterns: ['*'],
    check: (context, location) {
      logger.d('Navigating to ${location.state.routeInformation.location}');
      return true;
    },
  );
}


String _getInitialPath() {
  if (FirebaseAuth.instance.currentUser != null) {
    return VolunteeringScreen.route;
  }
  
  return WelcomeScreen.route;
}

BeamLocation<RouteInformationSerializable<dynamic>> _locationBuilder(
  RouteInformation routeInformation,
  BeamParameters? beamParameters,
) {
  if (routeInformation.location!.contains(UserWelcomeScreen.routeName)) {
    return UserWelcomeLocation(routeInformation);
  }
  if (routeInformation.location!.contains(WelcomeScreen.routeName)) {
    return WelcomeLocation(routeInformation);
  }
  if (routeInformation.location!.contains(LoginScreen.routeName)) {
    return LoginLocation(routeInformation);
  }
  if (routeInformation.location!.contains(SignupScreen.routeName)) {
    return SignupLocation(routeInformation);
  }
  if (routeInformation.location!.contains(VolunteeringScreen.routeName)) {
    return VolunteeringLocation(routeInformation);
  }
  if (routeInformation.location!.contains(ProfileScreen.routeName)) {
    return ProfileLocation(routeInformation);
  }
  if (routeInformation.location!.contains(NewsScreen.routeName)) {
    return NewsLocation(routeInformation);
  }
  return HomeLocation(routeInformation);
}
