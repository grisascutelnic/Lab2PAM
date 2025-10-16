import 'package:flutter/material.dart';
import '../models/new_recipe.dart';
import '../models/recipe.dart';
import '../widgets/new_recipe_card.dart';
import '../widgets/recipe_card.dart';
import '../widgets/category_selector.dart';
import '../widgets/top_bar.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;

  final List<String> categories = ['All', 'Indian', 'Italian', 'Asian', 'Chinese'];

  final List<Recipe> recipes = [
    Recipe(
        title: 'Classic Greek Salad',
        image: 'assets/images/classic_greek_salad.png',
        time: 15,
        rating: 4.5,
        author: 'John Doe'),
    Recipe(
        title: 'Crunchy Nut Coleslaw',
        image: 'assets/images/crunchy_nut_coleslaw.png',
        time: 10,
        rating: 3.5,
        author: 'Jane Doe'),
    Recipe(
        title: 'Shrimp chicken Andouille',
        image: 'assets/images/card3.png',
        time: 10,
        rating: 3.0,
        author: 'John Doe'),
    Recipe(
        title: 'Barbeque Chicken Jollof...',
        image: 'assets/images/card4.png',
        time: 10,
        rating: 4.5,
        author: 'Jane Doe'),
    Recipe(
        title: 'Portuguese Piri Piri Chicken',
        image: 'assets/images/card5.png',
        time: 10,
        rating: 4.5,
        author: 'Jane Doe')
  ];

  final List<NewRecipe> newRecipes = [
    NewRecipe(
      title: 'Steak with tomato sauce and bulgur rice.',
      recipeImage: 'assets/images/steak_with_tomato.png',
      userImage: 'assets/images/profile1.png',
      userName: 'James Milner',
      rating: 4,
      time: '15 mins',
    ),
    NewRecipe(
      title: 'Crunchy Nut Coleslaw',
      recipeImage: 'assets/images/crunchy_nut_coleslaw.png',
      userImage: 'assets/images/profile2.png',
      userName: 'Laura Wilson',
      rating: 5,
      time: '15 mins',
    ),
    NewRecipe(
      title: 'Rice Pilaf, Broccoli and Chicken',
      recipeImage: 'assets/images/new_recipe_3.png',
      userImage: 'assets/images/profile_3.png',
      userName: 'Lucas Maura',
      rating: 5,
      time: '20 mins',
    ),
    NewRecipe(
      title: 'Chicken meal with sauce',
      recipeImage: 'assets/images/new_recipe_4.png',
      userImage: 'assets/images/profile4.png',
      userName: 'Issabela Ethan',
      rating: 5,
      time: '20 mins',
    ),
    NewRecipe(
      title: 'Stir-fry chicken with broccoli in sweet and sour sauce and rice.',
      recipeImage: 'assets/images/new_recipe_5.png',
      userImage: 'assets/images/profile_5.png',
      userName: 'Miquel Ferron',
      rating: 5,
      time: '20 mins',
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold( // un widget principal al paginii (Scheletul paginii)
      body: SafeArea( // protejeaza continutul de regiunile speciale ale ecranului
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,//alinierea elementelor de-a lungul axei „secundare”
            children: [

              TopBar(),

              SizedBox(height: 40),

              CustomSearchBar(),

              SizedBox(height: 20),

              CategorySelector(),

              SizedBox(height: 20),

              //lista de recipe carduri
              SizedBox(
                height: 226, // cardHeight = 176 + 50
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none, // permite overflow-ul imaginilor
                  padding: EdgeInsets.only(top: 50),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(recipe: recipes[index]);
                  },
                ),
              ),


              SizedBox(height: 20),

              Text(
                'New Recipes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 40),
              //lista de new recipe carduri
              SizedBox(
                height: 95 + 60 / 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: newRecipes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: NewRecipeCard(recipe: newRecipes[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
