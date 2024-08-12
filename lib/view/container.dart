import 'package:flutter/material.dart';

// ignore: must_be_immutable
class mycontainer extends StatelessWidget {
  mycontainer({super.key, required this.name, required this.img});

  String name;
  String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 242, 245),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color:Colors.black87,
                blurRadius: 6,
                spreadRadius: 1.2,
                offset: Offset(4, 4)
              )
              
            ]
            ),
        height: 200,
        width: MediaQuery.of(context).size.width / 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: Image.asset(
                img,
                height: 85,
                width: 85,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'kurdish'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
