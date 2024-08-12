import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twezhinawa/model/firebase_auth_methods.dart';
import 'package:twezhinawa/view/Home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.lime[100],
          body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 55, 8, 0),
            child: Column(
              children: [
                //wenaka
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 355,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/w.png'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.center,
                      )),
                ),
                SizedBox(
                  height: 40,
                ),

                //button'kan
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8, 8.0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //facebook

                      ElevatedButton.icon(
                        onPressed: () {
                          context
                              .read<FirebaseAuthMethods>()
                              .signInWithFacebook();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 25,
                        ),
                        label: Text(
                          "چوونەژوورەوە لە فەیسبووکەوە",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontFamily: 'kurdish',
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 7, 70, 122),
                            shadowColor: Color.fromARGB(255, 29, 122, 199),
                            elevation: 10,
                            fixedSize: Size(90, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0))),
                      ),

                      //google
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            await context
                                .read<FirebaseAuthMethods>()
                                .signInWithGoogle();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          icon: FaIcon(FontAwesomeIcons.google,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          label: Text(
                            "چوونەژوورەوە لە ئیمەیڵەوە",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'kurdish',
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 212, 20, 20),
                              shadowColor: Colors.blue,
                              elevation: 10,
                              fixedSize: Size(90, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0))),
                        ),
                      ),

                      //twitter
                      ElevatedButton.icon(
                        onPressed: () async {
                            await context
                                  .read<FirebaseAuthMethods>()
                                  .signInAnonymously(context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                        },
                        icon:Icon(Icons.person_2,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        label: Text(
                          "چوونەژوورەوە وەک میوان",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'kurdish',
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 18, 172, 64),
                            shadowColor: Colors.blue,
                            elevation: 10,
                            fixedSize: Size(90, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0))),
                      ),

                      //phone number

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.phone_iphone, color: Colors.orange),
                          label: Text(
                            "چوونە ژوورەوە لە رێگای ژمارە مۆبایل",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.orange,
                                fontFamily: 'kurdish',
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shadowColor: Color.fromARGB(255, 29, 122, 199),
                              elevation: 10,
                              fixedSize: Size(90, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0))),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "بەخێربێیت بۆ بازوو بۆ داخڵبوون تکایە یەکێک لە بەتنەکانی سەرەوە دابگرە",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'kurdish',
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          
                          
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
