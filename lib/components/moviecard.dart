import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_list/models/movie.dart';
import 'package:movie_list/screens/homescreen/registermovie.dart';
import 'package:movie_list/services/movieProvider.dart';
import 'package:movie_list/utils/utility.dart';

class MovieCard extends StatelessWidget {
  final Movie? movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.black,
        decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Row(
          children: [
            (movie!.cover == null || movie!.cover!.length == 0)
                ? Container(
                    margin: EdgeInsets.all(0),
                    width: 200,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black54),
                    child: Center(
                        child: Text(
                      'Image was not found',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    )),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 210,
                      width: 200,
                      child: Utility.imageFromBase64String(movie!.cover!),
                    ),
                  ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie!.name.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 4),
                    Text(
                      movie!.director.toString(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12, left: 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddMovieList(
                                            isEditing: true,
                                            name: movie!.name,
                                            director: movie!.director,
                                            img64: movie!.cover,
                                            ogName: movie!.name,
                                          )));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Colors.green),
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Align(
                                        child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    )))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 18),
                        Container(
                          margin: EdgeInsets.only(right: 12, left: 0),
                          child: InkWell(
                            onTap: () {
                              MovieProvider.instance.deleteMovie(movie!);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text('Delete',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)))
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
