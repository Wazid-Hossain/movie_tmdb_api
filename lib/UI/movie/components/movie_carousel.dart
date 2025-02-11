import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_tmdb_api/constant/constants.dart';
import 'package:movie_tmdb_api/model/movie_model.dart';

class Movie_Carousel extends StatefulWidget {
  final List<MovieModel> movieList;
  const Movie_Carousel({super.key, required this.movieList});

  @override
  State<Movie_Carousel> createState() => _Movie_CarouselState();
}

class _Movie_CarouselState extends State<Movie_Carousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.movieList.length,
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return CachedNetworkImage(
          imageUrl:
              kmovieURL + widget.movieList[itemIndex].posterPath.toString(),
        );
      },
      options: CarouselOptions(
        height: 180,
      ),
    );
  }
}
