import 'package:buscador_rick_and_morty/ui/pages/character_detail_page.dart';
import 'package:buscador_rick_and_morty/ui/pages/character_list_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: CharacterListPage.name, builder: (context, state) => const CharacterListPage()),
    GoRoute( path: '/detail', name: CharacterDetailPage.name, builder: (context, state) {
        int? id = state.extra as int;
        return CharacterDetailPage(id: id);
      },
    ),
  ]
);