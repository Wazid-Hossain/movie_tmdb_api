import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_tmdb_api/UI/movie/components/movie_carousel.dart';
import 'package:movie_tmdb_api/model/movie_model.dart';
import 'package:movie_tmdb_api/services/api_services.dart';

class Movie_Home extends StatefulWidget {
  const Movie_Home({super.key});

  @override
  State<Movie_Home> createState() => _Movie_HomeState();
}

class _Movie_HomeState extends State<Movie_Home> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            future: apiServices
                .getMovieData(MovieType.nowPlaying), // Replace with your future
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MovieModel> moviedata = snapshot.data ?? [];
                return Movie_Carousel(
                  movieList: moviedata,
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }
}
