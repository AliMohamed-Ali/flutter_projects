import 'package:bookly_app/features/Home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/Home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter 
{
  static const kHomeView = "/homeView";
  static const kBookDetailsView = "/bookDetailsView";
  static final GoRouter router = GoRouter(
  routes: <RouteBase>[
     GoRoute(
      path: '/',
      builder: ( context,  state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: kHomeView,
      builder: ( context,  state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: ( context,  state) {
        return const BookDetailsView();
      },
    ),
  ],
  );
}