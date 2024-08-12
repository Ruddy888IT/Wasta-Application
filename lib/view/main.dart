import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twezhinawa/model/firebase_auth_methods.dart';
import 'package:twezhinawa/view/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twezhinawa/model/firebase_options.dart';

int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    FacebookAuth.i.webAndDesktopInitialize(
      appId: "919953459159624",
      cookie: true,
      xfbml: true,
      version: "v16.0",
    );
  }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
bool isDark = true;


saveData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
 
  preferences.setBool('isDark', isDark);
  
}



readData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  
  print(preferences.getBool('isDark'));
}
class _MyAppState extends State<MyApp> {
  ThemeData _darkTheme = ThemeData.dark()
      .copyWith(appBarTheme: AppBarTheme(backgroundColor: Colors.red));

  ThemeData _lighTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.orange),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.orange));

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection('product');
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MultiProvider(
        providers: [
          Provider<FirebaseAuthMethods>(
            create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<FirebaseAuthMethods>().authState,
            initialData: null,
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bazw',
          theme:  isDark ? _darkTheme : _lighTheme,
          home: SplashScreen(),
        ));
  }
}
