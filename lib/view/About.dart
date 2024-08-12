import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twezhinawa/control/constractor.dart';

class About extends StatelessWidget {
  final CardName cardname;
  const About({super.key,required this.cardname});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:
    
        Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 4, 1, 53),
            title: Center(
              child: Text(
                cardname.CName,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'kurdish', fontSize: 18),
              ),
            ),
          ),
        body: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 60, right: 8),
            child: Column(children: [
              Text(
                'ڕابەر نصرالدین حمەصالح',
                style: TextStyle(
                  fontFamily: 'Kurdish',
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.facebook,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        "Rabar N Abdulhamed",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'english'
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    color: Color.fromARGB(255, 19, 55, 85),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.snapchat,
                        size: 30,
                        color: Colors.black,
                      ),
                      Text(
                        "rudyabdulhamid8",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'english',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    color: Color.fromARGB(255, 243, 221, 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FaIcon(FontAwesomeIcons.github,
                      color: Colors.white,
                      size: 29,),
                      Text(
                        "ruddy888",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'english',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Text(
                'شانیا بەختیار قادر',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'kurdish',
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.facebook,
                        size: 30,
                        color: Colors.white,
                      ),
                      Text(
                        "Shanya Baxtyar",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontFamily: 'english',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    color: Color.fromARGB(255, 19, 55, 85),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.snapchat,
                        size: 30,
                        color: Colors.black,
                      ),
                      Text(
                        "shania_baxtyar",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'english',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.0),
                    color: Color.fromARGB(255, 243, 221, 25),
                  ),
                ),
              )
            ])
            )
            )
    );
  }
}
