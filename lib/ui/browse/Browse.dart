import 'package:flutter/material.dart';
import 'package:movies_app/ui/browse/CategoryCard.dart'; // Import the CategoryCard widget
import 'CatigoryMoviesDm.dart'; // Import the CategoryMovies class
typedef Onclickcategory = void Function(CategoryMovies category);

class Browse extends StatelessWidget {
  List<CategoryMovies>categories=CategoryMovies.getAllCategories();
  Browse();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Browse Category',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: buildCategoryGrid(),
    );
  }

  Widget buildCategoryGrid() {
    final categories = CategoryMovies.getAllCategories(); // Get the list of categories

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 16,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
      ),
      itemCount: categories.length, // Use the length of the categories list
      itemBuilder: (context, index) =>CategoryCard(categories[index]),
    );
  }
}
