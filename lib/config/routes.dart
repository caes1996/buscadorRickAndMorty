import 'package:buscador_rick_and_morty/ui/pages/lista_personajes_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: ListaPersonajesPage.name, builder: (context, state) => const ListaPersonajesPage()),
    // GoRoute(path: '/detail', name: AuthWrapper.name, builder: (context, state) => const AuthWrapper()),
  ]
);