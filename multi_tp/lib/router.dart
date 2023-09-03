import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_tp/views/edit_profile.dart';
import 'package:multi_tp/views/login.dart';
import 'package:multi_tp/views/signup.dart';
import 'package:multi_tp/views/welcome.dart';
import 'package:multi_tp/views/user_welcome.dart';

import 'views/home.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignupPage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/userwelcome',
      builder: (BuildContext context, GoRouterState state) {
        return const UserWelcomePage();
      },
    ),
    GoRoute(
      path: '/editprofile',
      builder: (BuildContext context, GoRouterState state) {
        return const EditProfilePage();
      },
    ),
  ],
);
