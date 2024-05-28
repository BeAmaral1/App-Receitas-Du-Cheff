import 'package:flutter/material.dart';
import 'package:receitas_du_cheff/components/custom_drawer.dart';
import 'package:receitas_du_cheff/models/meal.dart';
import 'package:receitas_du_cheff/screens/categories_screen.dart';
import 'package:receitas_du_cheff/screens/favorite_screen.dart';
import 'package:receitas_du_cheff/utils/app_routes.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;

  const TabsScreen({
    Key? key,
    required this.favoritesMeals,
  }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectScreenIndex = 0;
  List<Map<String, Object>> _listScreens = [];

  @override
  void initState() {
    super.initState();

    _listScreens = [
      {
        "title": "Receitas Du Cheff",
        "screen": const CategoriesScreen(),
        "label": "Categorias",
        "icon": const Icon(Icons.category_rounded),
      },
      {
        "title": "Comidas Favoritas",
        "screen": FavoriteScreen(favoriteMeals: widget.favoritesMeals),
        "label": "Favoritas",
        "icon": const Icon(Icons.star_rate_rounded)
      },
    ];
  }

  _selectedScreen(int index) => setState(() => _selectScreenIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _listScreens.elementAt(_selectScreenIndex)["title"] as String,
        ),
        flexibleSpace: Container(
          color: Colors.orange, // Define a cor de fundo como laranja
        ),
      ),
      drawer: CustomDrawer(
        routeName: AppRoutes.homeRoute,
      ),
      body: IndexedStack(
        index: _selectScreenIndex,
        children: [
          Container(
            color: Colors.white, // Cor de fundo para Categorias
            child: _listScreens.elementAt(0)["screen"] as Widget,
          ),
          Container(
            color: Colors.white, // Cor de fundo para Favoritas
            child: _listScreens.elementAt(1)["screen"] as Widget,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.yellow,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectScreenIndex,
        items: _listScreens
            .map(
              (screenElement) => BottomNavigationBarItem(
                label: screenElement["label"] as String,
                icon: screenElement["icon"] as Icon,
              ),
            )
            .toList(),
      ),
    );
  }
}
