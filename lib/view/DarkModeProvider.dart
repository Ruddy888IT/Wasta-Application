
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DarkModeProvider extends ChangeNotifier {
//   late bool _isDarkModeEnabled;

//   bool get isDarkModeEnabled => _isDarkModeEnabled;

//   DarkModeProvider() {
//     _isDarkModeEnabled = false; // Default value

//     // Load the dark mode preference from SharedPreferences
//     loadDarkModePreference();
//   }

//   Future<void> loadDarkModePreference() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     _isDarkModeEnabled = prefs.getBool('darkMode') ?? false;

//     // Notify listeners that the value has been loaded
//     notifyListeners();
//   }

//   Future<void> toggleDarkMode(bool value) async {
//     _isDarkModeEnabled = value;

//     // Save the dark mode preference to SharedPreferences
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('darkMode', _isDarkModeEnabled);

//     // Notify listeners that the value has changed
//     notifyListeners();
//   }
// }
