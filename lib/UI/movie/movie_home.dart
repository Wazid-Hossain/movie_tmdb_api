import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_tmdb_api/model/movie_model.dart';

class Movie_Home extends StatefulWidget {
  const Movie_Home({super.key});

  @override
  State<Movie_Home> createState() => _Movie_HomeState();
}

class _Movie_HomeState extends State<Movie_Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            future: null, // Replace with your future
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MovieModel> moviedata = snapshot.data ?? [];
                return CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Text(
                              'text $i',
                              style: TextStyle(fontSize: 16.0),
                            ));
                      },
                    );
                  }).toList(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
