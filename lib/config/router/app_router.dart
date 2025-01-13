
import 'package:go_router/go_router.dart';


import '../../presentation/screens/movies/login_screen.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    
    GoRoute(
      path: '/home/:pageIndex',
      name: HomeScreen.name,
      builder: (context, state) {
        
        final pageIndex = int.tryParse( state.pathParameters['pageIndex'] ?? '0' ) ?? 0;

        return HomeScreen( pageIndex: pageIndex );
      },
      routes: [
         GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';

            return MovieScreen( movieId: movieId );
          },
        ),
      ]
    ),

    GoRoute(
      name: LoginPage.name,
      path: '/login', 
      builder: ((context, state) => const LoginPage())
      
    ),

],

   // Redirección desde la ruta raíz a la página de inicio
  redirect: (context, state) {
    if (state.path == '/') {
      return '/login';
    }
    return null;
  },
);