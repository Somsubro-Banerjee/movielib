import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_list/models/movie.dart';
import 'package:movie_list/services/movieProvider.dart';
import 'package:movie_list/utils/utility.dart';

// ignore: must_be_immutable
class AddMovieList extends StatefulWidget {
  AddMovieList(
      {Key? key,
      this.img64 = "",
      this.isEditing = false,
      this.director = "",
      this.name = "",
      this.ogName = ""})
      : super(key: key);
  String? img64;
  String? name;
  String? ogName;
  String? director;
  bool isEditing;
  @override
  _AddMovieListState createState() => _AddMovieListState();
}

class _AddMovieListState extends State<AddMovieList> {
  pickImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
      widget.img64 = Utility.base64String(await value!.readAsBytes());
      setState(() {
        widget.img64 = widget.img64;
      });
    });
  }

  String? formValidator(String? vlaue) {
    return (vlaue == "") ? 'This field cannot be empty' : null;
  }

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.isEditing) {
      nameController.text = widget.name!;
      directorController.text = widget.director!;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Add a movie',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          margin: EdgeInsets.only(top: 0),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        (widget.img64 == "")
                            ? Container(
                                margin: EdgeInsets.all(0),
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    color: Colors.black87),
                                child: Center(
                                    child: Text(
                                  "Click 'Choose a Image File' to select a Image",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                )),
                              )
                            : Container(
                                margin: EdgeInsets.all(0),
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Utility.imageFromBase64String(
                                        widget.img64!)),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => pickImage(),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        height: 40,
                        width: 150,
                        child: Center(
                          child: Text(
                            'Choose a Image File',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: Theme.of(context).inputDecorationTheme.hintStyle,
                    controller: nameController,
                    validator: formValidator,
                    decoration: InputDecoration(
                      hintText: 'Name of the movie',
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 15),
                      enabled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0)),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0)),
                      // contentPadding: EdgeInsets.all(8),
                      focusColor: Colors.blue,
                      fillColor: Colors.white,
                      hoverColor: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: Theme.of(context).inputDecorationTheme.hintStyle,
                    controller: directorController,
                    validator: formValidator,
                    decoration: InputDecoration(
                      hintText: 'Directed by',
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 15),
                      enabled: true,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0)),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 3.0)),
                      // contentPadding: EdgeInsets.all(8),
                      focusColor: Colors.blue,
                      fillColor: Colors.white,
                      hoverColor: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (!_key.currentState!.validate()) return;
                        print(nameController.text);
                        Movie movie = Movie();
                        movie.name = nameController.text;
                        movie.director = directorController.text;
                        movie.cover = widget.img64;
                        if (widget.isEditing) {
                          MovieProvider.instance
                              .updateMovies(movie, widget.ogName!);
                          Navigator.pop(context);
                        } else {
                          MovieProvider.instance.addMovie(movie);
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        (widget.isEditing) ? 'Update' : 'Submit',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
