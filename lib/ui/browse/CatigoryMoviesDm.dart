import 'dart:ui';
import 'package:flutter/foundation.dart';

class CategoryMovies {
  int id;
  String name;

  String imagename;

  CategoryMovies(this.id, this.name, this.imagename);

  static List<CategoryMovies> getAllCategories() {
    return [
      CategoryMovies(10759, 'Action', 'Action.png'),
      CategoryMovies(10752, 'War', 'War.png'),

      CategoryMovies(9648, 'Mystery', 'Mystery.png'),

      CategoryMovies(53, 'Thriller', 'Thriller.png'),

      CategoryMovies(27, 'Horror', 'Horror.png'),

      CategoryMovies(14, 'Fantasy', 'Fantasy.png'),
      CategoryMovies(18, 'Drama', 'Drama.png'),
      CategoryMovies(80, 'Crime', 'Crime.png'),
      CategoryMovies(35, 'Comedy', 'Comedy.png'),
      CategoryMovies(10749, 'Romance', 'Romance.png'),

      // Add more categories as needed
    ];
  }
}
