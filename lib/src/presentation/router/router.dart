import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/my_comments_page.dart';
import '../pages/my_posts_page.dart';
import '../pages/test_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/posts',
  routes: <GoRoute>[
    GoRoute(
      path: '/posts',
      builder: (BuildContext context, GoRouterState state) =>
          const MyPostsPage('title'),
    ),
    GoRoute(
      path: '/comments',
      builder: (BuildContext context, GoRouterState state) {
        final map = state.extra as Map<String, dynamic>;
        print("${map['id']}, ${map['title']}");

        return MyCommentsPage(
          map['id'],
          map['title']!,
        );
      },
    ),
    GoRoute(
      name: 'test',
      path: '/test/:ids',
      builder: (BuildContext context, GoRouterState state) {
        print('${(state.extra as Map<String, String>)['url']}');

        return TestPage(
          state.params['ids']!,
        );
      },
    ),
  ],
);

class RouterParam {
  final int id;
  RouterParam(this.id);
}
