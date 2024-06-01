import 'package:flutter/material.dart';
import 'package:receitas_du_cheff/models/filters.dart';
import 'package:receitas_du_cheff/screens/categories_meals_screen.dart';
import 'package:receitas_du_cheff/screens/error_screen.dart';
import 'package:receitas_du_cheff/screens/meal_details_screen.dart';
import 'package:receitas_du_cheff/screens/filters_screen.dart';
import 'package:receitas_du_cheff/screens/tabs_screen.dart';
import 'package:receitas_du_cheff/utils/app_routes.dart';
import 'package:receitas_du_cheff/data/dummy_data.dart';
import 'package:receitas_du_cheff/screens/loading_screen.dart';
import 'models/meal.dart';
import 'package:receitas_du_cheff/screens/login_screen.dart';
import 'package:receitas_du_cheff/screens/loading_cadastrar.dart';
import 'package:receitas_du_cheff/screens/loading_esqueceu_senha.dart';
import 'package:receitas_du_cheff/screens/sobre_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variavel que armazena os Filtros e as Comidas que serão exibidas
  Filters filters = Filters();
  List<Meal> avalaibleMeals = dummyMeals;
  List<Meal> favoritesMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas Du Cheff',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
            .copyWith(secondary: Colors.black),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
              headline6: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              button: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
        canvasColor: Colors.black,
      ),
      routes: {
        AppRoutes.homeRoute: (ctx) =>
            TabsScreen(favoritesMeals: favoritesMeals),
        AppRoutes.categoryMeals: (ctx) =>
            CategoriesMealsScreen(avalaibleMeals: avalaibleMeals, availableMeals: [],),
        AppRoutes.mealDetails: (ctx) => MealDetailsScreen(
              onClickFavorite: _toggleFavorites,
              isFavoriteMeal: _isFavoriteMeal,
            ),
        AppRoutes.filters: (ctx) =>
            FiltersScreen(filters: filters, onFiltersChanged: _filterMeals),
        AppRoutes.login: (ctx) => LoginScreen(),
        AppRoutes.sobre: (ctx) => SobreScreen(),
        AppRoutes.loading: (ctx) => LoadingScreen(),
        AppRoutes.loadingEsqueceuSenha: (ctx) => LoadingEsqueceuSenhaScreen(),
        AppRoutes.loadingCadastrar: (ctx) => LoadingCadastrarScreen(),
      },
      initialRoute: AppRoutes.homeRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => const ErrorScreen()),
    );
  }

  void _filterMeals(Filters filtersUpdated) {
    setState(() {
      filters = filtersUpdated;

      avalaibleMeals = dummyMeals.where((mealItem) {
        final filterGluten =
            filtersUpdated.isGlutenFree && !mealItem.isGlutenFree;
        final filterLactose =
            filtersUpdated.isLactoseFree && !mealItem.isLactoseFree;
        final filterVegan = filtersUpdated.isVegan && !mealItem.isVegan;
        final filterVegetarian =
            filtersUpdated.isVegetarian && !mealItem.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorites(Meal meal) {
    setState(() {
      favoritesMeals.contains(meal)
          ? favoritesMeals.remove(meal)
          : favoritesMeals.add(meal);
    });
  }

  bool _isFavoriteMeal(Meal meal) => favoritesMeals.contains(meal);
}
