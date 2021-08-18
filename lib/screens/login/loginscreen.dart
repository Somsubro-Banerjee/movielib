import 'package:flutter/material.dart';
import 'package:movie_list/services/authService.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

List<String> imgList = [
  'images/god.jpg',
  'images/peeky.jpg',
  'images/spoiderman.jpg',
  'images/tenet.jpg',
  'images/avengers.jpg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ),
        ))
    .toList();

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggingIn = false;
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: (isLoggingIn)
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/mobidb.jpg"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.8), BlendMode.darken),
                        fit: BoxFit.cover,
                        scale: 200,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'MovieDB',
                          style: TextStyle(
                              letterSpacing: 5,
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: 'ubuntu'),
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                        // Text(
                        //   'MovieDB',
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 35,
                        //       fontFamily: 'ubuntu'),
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Your own Movie Database',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'ubuntu'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CarouselSlider(
                            options: CarouselOptions(
                              pageSnapping: true,
                              initialPage: 0,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              // reverse: true,

                              // height: 400.0,
                              aspectRatio: 2 / 2,
                              viewportFraction: 0.8,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: true,
                            ),
                            items: imageSliders),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            'Continue with Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'ubuntu'),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Container(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isLoggingIn = true;
                              });
                              await AuthService().login();
                              setState(() {
                                isLoggingIn = false;
                              });
                            },
                            child: Text(
                              'G+',
                              style: TextStyle(color: Colors.red, fontSize: 25),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 18, right: 18, top: 8, bottom: 9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            'Made with ❤ by Somsubro',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'ubuntu'),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ));
  }
}
