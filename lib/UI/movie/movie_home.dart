import 'package:flutter/material.dart';

class Movie_Home extends StatefulWidget {
  const Movie_Home({super.key});

  @override
  State<Movie_Home> createState() => _Movie_HomeState();
}

class _Movie_HomeState extends State<Movie_Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        "Movie Home",
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
