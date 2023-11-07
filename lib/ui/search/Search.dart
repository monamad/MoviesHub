import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_manager.dart';
import 'package:movies_app/data/models/movie_model.dart';
import '../myThemeData/MyThemeData.dart';
import 'SearchWidget.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';
  List<Movie> movies = []; // Change 'movies' to a list
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: MyThemeData.lightprimary,
        title: TextFormField(
          cursorColor: Colors.white,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 21,
          ),
          controller: search,
          onChanged: (String value) {
            setState(() {
              query = value;
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            filled: true,
            fillColor: MyThemeData.secondaryprimarycontainer,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onSecondary),
            ),
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 32,
              ),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  query = '';
                  search.clear();
                });
              },
              icon: Icon(
                Icons.close,
                size: 32,
              ),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6)),
          ),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<MoviesModel>(
            future: ApiManager.getSearchMovies(query),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                movies = snapshot.data?.results ?? [];
                movies.sort((a, b) => (a.originalTitle ?? "").compareTo(b.originalTitle ?? "")); // Sort movies by title
                // Sort movies by title

                return SearchWidget(
                  movies: movies, // Pass the sorted movies
                  query: query,
                );
              } else {
                return Text('No results found.');
              }
            },
          ),
        ],
      ),
    );
  }
}
