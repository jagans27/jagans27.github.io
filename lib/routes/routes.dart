import 'package:go_router/go_router.dart';
import 'package:portfolio/routes/pages.dart';
import 'package:portfolio/screens/home/home_screen.dart';
import 'package:portfolio/screens/page_not_found/page_not_found.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: Pages.homeScreen,
    routes: [
      GoRoute(
        path: Pages.homeScreen,
        builder: (context, state) {
          // Read query param `tab`
          final tab = state.uri.queryParameters['tab'];
          int initialIndex = 0;
          if (tab == 'project') {
            initialIndex = 1;
          }

          print("➡️ Route rebuild with tab=$tab, index=$initialIndex");

          return HomeScreen(initialIndex: initialIndex);
        },
      ),
    ],
    errorBuilder: (context, state) => PageNotFound(),
  );
}


