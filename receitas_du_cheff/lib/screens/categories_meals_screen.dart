import 'package:flutter/material.dart';
import 'package:receitas_du_cheff/components/meal_item.dart';
import 'package:receitas_du_cheff/models/category.dart';
import 'package:receitas_du_cheff/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> avalaibleMeals;

  const CategoriesMealsScreen({
    Key? key,
    required this.avalaibleMeals, required List<Meal> availableMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtem os Dados passado pela Route
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    // Obtem as Comidas da Categoria Infromada
    final mealsInCategory = avalaibleMeals.where((mealElement) {
      return mealElement.listCategories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Receitas"),
        backgroundColor: Colors.orange, // Define a cor laranja para o AppBar
      ),
      body: Container(
        color: Colors.orange, // Define a cor laranja para o fundo da lista de refeições
        child: ListView.builder(
          itemCount: mealsInCategory.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (ctx, index) => MealItem(
            meal: mealsInCategory.elementAt(index),
          ),
        ),
      ),
    );
  }
}
