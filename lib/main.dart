import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  //Recipe list and details
  final List<Map<String, dynamic>> recipes = [
    {'title': 'PB&J', 
    'detail': 'A simple childhood favorite.',
    'ingredients': [
      'Bread',
      'Peanut Butter',
      'Jelly or Jam',
    ],
    'instructions': [
      'Get two slices of bread.',
      'Evenly spread peanut butter on one slice.',
      'Even spread jelly or jam on the other.',
      'Combine both slices together with the peanut butter and jelly sides touching.',
    ],
    },
    {'title': 'Spaghetti and Ragu', 
    'detail': 'An easy recipe for beginners.',
    'ingredients': [
      'Spaghetti',
      'Jar of your prefered spaghetti sauce',
      'Ground Beef',
    ],
    'instructions': [
      'Begin cooking your spaghetti according to packaging or personal preference',
      'While your pasta is cooking, in a medium sauce pan brown the ground beef.',
      'After the ground beef is ground, add in your pasta sauce.',
      'Bring the sauce to a low simmer for 5 minutes. This is where you should season to taste with salt.',
      'After you pasta is done, serve pasta with a generous amount of the sauce you made.',
    ],
    },
  ];
  //home page and navigation to recipes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Home Page')),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]['title']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

//recipe detail display
class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  RecipeDetailScreen(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipe['detail']!, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('Ingredients:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            for (var ingredient in recipe['ingredients'])
              Text('• $ingredient', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Instructions:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            for (var instruction in recipe['instructions'])
              Text('• $instruction', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
