import 'package:flutter/material.dart';
import 'package:twezhinawa/control/constractor.dart';
import 'package:twezhinawa/view/main.dart';

class Settings extends StatefulWidget {
  final CardName cardname;
  const Settings({super.key, required this.cardname});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  
  IconData _darkIcon = Icons.nights_stay;

  IconData _lighIcon = Icons.sunny;

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 4, 1, 53),
            title: Center(
              child: Text(
                widget.cardname.CName,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'kurdish', fontSize: 18),
              ),
            ),
          ),
          body: Container(child: Center(
            child: IconButton(
                    onPressed: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                    icon: Icon(isDark ? _lighIcon : _darkIcon)
                    ),
          ),),
    ));
  }
}