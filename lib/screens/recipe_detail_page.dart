import 'package:flutter/material.dart';
import '../models/ingredient.dart';
import '../widgets/ingredient_item.dart';
import '../widgets/ingredient_procedure_tab.dart';
import '../widgets/profile_row.dart';
import '../widgets/recipe_detail.dart';
import '../models/new_recipe.dart';
import '../widgets/serve_items_row.dart';

class RecipeDetailPage extends StatelessWidget {
  final NewRecipe recipe;

  RecipeDetailPage({required this.recipe, super.key});

  final List<Ingredient> ingredients = [
    Ingredient(title: 'Tomatoes', imagePath: 'assets/images/tomato.png', quantity: '500g'),
    Ingredient(title: 'Cabbage', imagePath: 'assets/images/cabbage.png', quantity: '300g'),
    Ingredient(title: 'Taco', imagePath: 'assets/images/taco.png', quantity: '200g'),
    Ingredient(title: 'Slice bread', imagePath: 'assets/images/slice_bread.png', quantity: '100g'),
    Ingredient(title: 'Green onion', imagePath: 'assets/images/ingredient5.png', quantity: '300g'),
    Ingredient(title: 'Omelette', imagePath: 'assets/images/ingredient6.png', quantity: '300g'),
    Ingredient(title: 'Hot Dog', imagePath: 'assets/images/ingredient7.png', quantity: '300g'),
    Ingredient(title: 'Onion', imagePath: 'assets/images/ingredient8.png', quantity: '300g'),
    Ingredient(title: 'Lettuce', imagePath: 'assets/images/ingredient9.png', quantity: '300g'),
    Ingredient(title: 'Spinach', imagePath: 'assets/images/ingredient10.png', quantity: '300g'),
    Ingredient(title: 'Red & Green Chilli', imagePath: 'assets/images/ingredient11.png', quantity: '300g'),
    Ingredient(title: 'Fries', imagePath: 'assets/images/ingredient12.png', quantity: '300g'),
    Ingredient(title: 'Chicken', imagePath: 'assets/images/ingredient13.png', quantity: '300g'),
    Ingredient(title: 'Burger', imagePath: 'assets/images/ingredient14.png', quantity: '300g'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back arrow
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back, color: Colors.black, size: 28),
                    ),
                    Spacer(), // împinge următorul widget în dreapta
                    Icon(Icons.more_horiz, color: Colors.black, size: 28), // 3 puncte orizontale
                  ],
                ),

                SizedBox(height: 16),

                // Detalii rețetă
                RecipeDetail(recipe: recipe),
                SizedBox(height: 12),

                // Widget profil
                ProfileRow(
                  profileImagePath: 'assets/images/profile2.png',
                ),
                SizedBox(height: 20),

                // Tabs Ingredient / Procedure
                IngredientProcedureTabs(),
                SizedBox(height: 40),

                // Serve & Items row
                ServeItemsRow(
                  serve: '1 Serve',
                  items: '10 Items',
                  iconPath: 'assets/images/serve_icon.png',
                ),
                SizedBox(height: 25),

                // Lista ingredientelor
                Column(
                  children: ingredients.map((ingredient) {
                    return IngredientItem(
                      imagePath: ingredient.imagePath,
                      title: ingredient.title,
                      quantity: ingredient.quantity,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
