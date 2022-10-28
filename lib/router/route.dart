// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:reddit_clone/features/screens/massage/massage_screen.dart';
// import 'package:reddit_clone/features/screens/notification/notification_screen.dart';
// import 'package:reddit_clone/features/screens/post/post_screen.dart';

// import '../features/buttom_nav.dart';
// import '../features/screens/home/home_screen.dart';
// import '../features/screens/search/search_screen.dart';
// import '../core/utils/error.dart';
// import 'router_name.dart';

// final routerProvider = Provider<GoRouter>(
//   (ref) {
//     final GlobalKey<NavigatorState> rootNavigatorKey =
//         GlobalKey<NavigatorState>(debugLabel: 'root');
//     final router = RouterNotifier();
//     return GoRouter(
//       navigatorKey: rootNavigatorKey,
//       debugLogDiagnostics: true,
//       routes: router.routes,
//       refreshListenable: router,
//       initialLocation: RouteName.home.path,
//       errorBuilder: (context, state) => ErrorPage(state: state),
//     );
//   },
// );

// class RouterNotifier extends ChangeNotifier {
//   RouterNotifier();

//   final GlobalKey<NavigatorState> _shellNavigatorKey =
//       GlobalKey<NavigatorState>(debugLabel: 'shell');

//   List<RouteBase> get routes => [
//         ShellRoute(
//           navigatorKey: _shellNavigatorKey,
//           builder: (context, state, child) => ButtonNavBar(child: child),
//           routes: [
//             GoRoute(
//               path: RouteName.home.path,
//               name: RouteName.home.name,
//               builder: (context, state) => const HomeScreen(),
//             ),
//             GoRoute(
//               path: RouteName.search.path,
//               name: RouteName.search.name,
//               builder: (context, state) => const SearchScreen(),
//             ),
//             GoRoute(
//               path: RouteName.post.path,
//               name: RouteName.post.name,
//               builder: (context, state) => const PostScreen(),
//             ),
//             GoRoute(
//               path: RouteName.massage.path,
//               name: RouteName.massage.name,
//               builder: (context, state) => const MassageScreen(),
//             ),
//             GoRoute(
//               path: RouteName.notification.path,
//               name: RouteName.notification.name,
//               builder: (context, state) => const NotificationScreen(),
//             ),
//           ],
//         ),
//       ];
// }
