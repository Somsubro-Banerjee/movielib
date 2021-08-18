import 'package:flutter/material.dart';
import 'package:movie_list/components/moviecard.dart';
import 'package:movie_list/models/movie.dart';
import 'package:movie_list/services/movieProvider.dart';
import 'package:provider/provider.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  void initState() {
    MovieProvider.instance.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<List<Movie>>(context);
    // ignore: unnecessary_null_comparison
    return (movies.length == 0)
        ? Scaffold(
            body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Text(
                  "You have not added anything in the list yet!",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Click '+' to add a new movie",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ))
        : Scaffold(
            backgroundColor: Colors.white,
            body: ListView.builder(
                shrinkWrap: true,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MovieCard(
                      movie: movies[index],
                    ),
                  );
                }),
          );
  }
}
