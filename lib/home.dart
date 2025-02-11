import 'package:flutter/material.dart';
import 'package:movie_tmdb_api/UI/movie/movie_home.dart';
import 'package:movie_tmdb_api/UI/tv/tv_home.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int _selectedIndex = 0;

// for movie and tv page set changes
  Widget getView() {
    if (_selectedIndex == 0) {
      return Movie_Home();
    } else {
      return TvHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Movie App'),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: getView(),
      //Bottom Navigation Bar for switching between Movies and TV Shows.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV Shows',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'Profile',
          // ),
        ],
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
      ),
    );
  }
}
