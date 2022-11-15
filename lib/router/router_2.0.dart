import 'package:flutter/material.dart';
import 'package:reddit_clone/features/community/screens/communites_screen.dart';
import 'package:reddit_clone/features/community/screens/create_communty.dart';
import 'package:reddit_clone/features/community/screens/edit_community_screen.dart';
import 'package:reddit_clone/features/screens/home/home_screen.dart';
import 'package:routemaster/routemaster.dart';

import '../features/community/screens/mod_tools.dart';
import 'route_name.dart';
import '../features/auth/login_screen.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(
        child: HomeScreen(),
      ),
  RouterConstants.createCommunity: (_) => const MaterialPage(
        child: CreateCommunityScreen(),
      ),

  //Nasted Route
  '/r/:name': (route) => MaterialPage(
        child: CommunitiesScreen(
          name: route.pathParameters['name']!,
        ),
      ),

  '/mod-tools/:name': (routedata) => MaterialPage(
        child: ModToolsScreen(
          name: routedata.pathParameters['name']!,
        ),
      ),
  '//edit-communities/:name': (routedata) => MaterialPage(
        child: EditCommunityScreen(
          name: routedata.pathParameters['name']!,
        ),
      )
});
