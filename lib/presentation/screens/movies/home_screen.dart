import 'package:flutter/material.dart';

import '../../views/movies/theme_view.dart';
import '../../views/views.dart';
import '../../widgets/widgets.dart';





class HomeScreen extends StatelessWidget {

  static const String name = 'home-screen';
  final int pageIndex;

  const HomeScreen({
    super.key, 
    required this.pageIndex
  });

  final viewRoutes =  const <Widget>[
    HomeView(),
    FavoritesView(),
    ThemeChangerScreen(), // <--- categorias View
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation( currentIndex: pageIndex ),
    );
  }
}

