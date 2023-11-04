import 'package:flutter/material.dart';
import 'package:movies_app/ui/browse/Browse.dart';
import 'package:movies_app/ui/home/Home.dart';
import 'package:movies_app/ui/search/Search.dart';
import 'package:movies_app/ui/watchList/WatchList.dart';

enum Page {
  home,
  search,
  browse,
  watchlist,
}

class HomePage extends StatefulWidget{
  static String routeName = "Homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

Page currentPage = Page.home;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentPage = Page.values[index];
          });
        },
        currentIndex: currentPage.index,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1A1A1A),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1A1A1A),
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1A1A1A),
            icon: Icon(Icons.movie),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1A1A1A),
            icon: Icon(Icons.bookmark),
            label: 'Watchlist',
          ),
        ],
      ),
      body: _buildPage(currentPage),
    );
  }

  Widget _buildPage(Page page) {
    switch (page) {
      case Page.home:
        return Home();
      case Page.search:
        return Search();
      case Page.browse:
        return Browse();
      case Page.watchlist:
        return WatchList();
    }
  }
}
