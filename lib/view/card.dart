import 'package:flutter/material.dart';

// ignore: must_be_immutable
class card extends StatelessWidget {
  card({super.key, required this.name, required this.logo});

  var name;
  var logo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        color: Color.fromARGB(255, 84, 135, 201),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: ListTile(
          title: Text(
            name,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontFamily: 'kurdish'),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              logo,
              size: 24,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
