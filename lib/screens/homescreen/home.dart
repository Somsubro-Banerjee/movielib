import 'package:flutter/material.dart';
import 'package:movie_list/models/movie.dart';
import 'package:movie_list/screens/homescreen/moviesList.dart';
import 'package:movie_list/screens/homescreen/registermovie.dart';
import 'package:movie_list/services/authService.dart';
import 'package:provider/provider.dart';
import 'package:movie_list/services/movieProvider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var movies = Provider.of<List<Movie>>(context);
    return StreamProvider<List<Movie>>.value(
      value: MovieProvider.instance.moviesStream,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'MovieDB',
            style: TextStyle(color: Colors.white, letterSpacing: 5),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  AuthService().logout();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        body: MovieListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddMovieList()));
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
