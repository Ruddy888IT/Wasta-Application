import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twezhinawa/view/About.dart';
import 'package:twezhinawa/view/Settings.dart';
import 'package:twezhinawa/view/add.dart';
import 'package:twezhinawa/view/card.dart';
import 'package:twezhinawa/control/constractor.dart';
import 'package:twezhinawa/view/container.dart';
import 'package:twezhinawa/view/login.dart';
import 'package:twezhinawa/view/product/product_wastakan.dart';
import 'package:twezhinawa/view/product/product_bargdwr.dart';
import 'package:twezhinawa/view/product/product_aw_w_awaro.dart';
import 'package:twezhinawa/view/product/product_staff.dart';
import 'package:twezhinawa/view/product/product_karaba.dart';
import 'package:twezhinawa/view/product/product_chakrdnawa.dart';
import 'package:twezhinawa/view/product/product_chakrdnaway_autombel.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LogInWidget extends StatefulWidget {
  LogInWidget({super.key});

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  static List<String> works = [
    'وەستاکان',
    'بەرگدروو',
    'چاککردنەوە',
    'ئاو و ئاوەڕۆ',
    'چاککەرەوەی ئۆتۆمبێل',
    'کارەبا',
    'ستافەکان',
    'کارگەکان'
  ];

  List img = [
    'assets/images/pngegg (1).png',
    'assets/images/PngItem_3571436.png',
    'assets/images/pngwing.com (1).png',
    'assets/images/pngwing.com (2).png',
    'assets/images/pngwing.com (3).png',
    'assets/images/karaba.png',
    'assets/images/pngegg.png',
    'assets/images/industry-icon-png-20.png'
  ];

  static List<String> CName = [
    'ماڵەوە',
    'زیادکردنەکان',
    'ڕێکخستنەکان',
    'دەربارەی ئێمە ',
  ];

  List<String> crousalList = [
    'assets/images/crousel/Screenshot (2).png',
    'assets/images/crousel/1.png',
    'assets/images/worker-working-in-construction-project-2923057-2430707.webp'
  ];

  int s = 1;
  final List<AppBarName> RouteName =
      List.generate(works.length, (index) => AppBarName('${works[index]}'));

  final List<CardName> cardname =
      List.generate(CName.length, (index) => CardName('${CName[index]}'));


      User? currentUser;
       String accountImage = '';
  @override
  void initState() {
    super.initState();
    fetchAuthenticationData();
  }

  Future<void> fetchAuthenticationData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is signed in
      setState(() {
        currentUser = user;
        accountImage = user.photoURL ?? generateAccountImage(user.email ?? '');
      });
    } else {
      // User is signed out
      setState(() {
        currentUser = null;
        accountImage = '';
      });
    }
  }


  
  String generateAccountImage(String email) {
    String initials = '';
    List<String> parts = email.split('@');
    if (parts.length > 0) {
      String name = parts[0];
      List<String> nameParts = name.split('.');
      initials = nameParts.map((part) => part[0]).join('');
    }
    return 'https://via.placeholder.com/150?text=$initials'; // Placeholder image URL with initials
  }



  @override
  Widget build(BuildContext context) {

    final List<Widget> imageSliders = crousalList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'ڵەگەڵ ئێمە ڕیکلام بکە ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'kurdish',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 1, 53),
          title: Center(
            child: Text(
              'بازوو',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'kurdish', fontSize: 18),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Add(
                              cardname: cardname[1],
                            )));
              },
              icon: Icon(Icons.add),
              tooltip: 'زیادکردنی نوێ',
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 4, 1, 53),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(85))),
                accountName: Text('${currentUser?.displayName ?? ' میوان  '}',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 236, 234, 232))),
                accountEmail: Text(' ${currentUser?.email ??currentUser?.uid ?? 'N/A'}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255))),
                currentAccountPicture: CircleAvatar(
                  
                  backgroundImage:  NetworkImage(accountImage),
                
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => LogInWidget()));
                  },
                  child: card(name: CName[0], logo: Icons.home)),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Add(
                                  cardname: cardname[1],
                                )));
                  },
                  child: card(name: CName[1], logo: Icons.add)),
              
              GestureDetector(
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Settings(
                                  cardname: cardname[2],
                                )));
                  
                },
                child: card(name: CName[2], logo: Icons.settings)),
              GestureDetector(
                onTap: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => About(
                                  cardname: cardname[3],
                                )));
                },
                child: card(name: CName[3], logo: Icons.build_circle_rounded)),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: card(name: "دەرچوون", logo: Icons.logout))
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
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
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             
            Text(
              '145,600  =  100',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'kurdish'),
            ),
             FaIcon(FontAwesomeIcons.dollarSign,color: Colors.black,),
          ],
        ),
      ),
            ),
            Container(
                child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 2,
                autoPlay: true,
              ),
              items: imageSliders,
            )),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              color: Color.fromARGB(255, 255, 255, 255),
              child: GridView.count(crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => product_wastakan(appbarname: RouteName[0], works: works[0],
                              
                                )));
                  },
                  child: mycontainer(name: works[0], img: img[0])),
                GestureDetector(onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => product_bargdwr(appbarname: RouteName[1], works: works[1],
                              
                                )));
                  },
                  child: mycontainer(name: works[1], img: img[1])),
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => product_chakrdnawa(appbarname: RouteName[2], works: works[2],
                              
                                )));
                  },
                  child: mycontainer(name: works[2], img: img[2])),
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => product_aw_w_awaro(appbarname: RouteName[3], works: works[3],
                              
                                )));
                  },
                  child: mycontainer(name: works[3], img: img[3])),
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => product_chakaraway_autombel(appbarname: RouteName[4], works: works[4],
                              
                                )));
                  },
                  child: mycontainer(name: works[4], img: img[4])),
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => product_karaba(appbarname: RouteName[5], works: works[5],
                              
                                )));
                  },
                  child: mycontainer(name: works[5], img: img[5])),
                GestureDetector(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => product_staff(appbarname: RouteName[6], works: works[6],
                              
                                )));
                  },
                  child: mycontainer(name: works[6], img: img[6])),
              ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.black,
                        height: 3,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: Text(
                          'هەلی کار',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'kurdish',
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        height: 3,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ],
                    
                  ),
                  SizedBox(
                    height: 10,
                  ),
                    Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 242, 245),
            borderRadius: BorderRadius.circular(18),
             boxShadow: [
              BoxShadow(
                color:Colors.black87,
                blurRadius: 6,
                spreadRadius: 1.2,

              )
              
            ]
            ),
        height: MediaQuery.of(context).size.height/5,
        width: MediaQuery.of(context).size.width / 1.2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: Image.asset(
                'assets/images/pngwing.com.png',
                height: MediaQuery.of(context).size.height/9,
                width: MediaQuery.of(context).size.width/4,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  'هەلی کار ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'kurdish'),
                ),
              ),
            ),
          ],
        ),
      ),
    )
                ],
              ),
              
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: s,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black26,
          selectedItemColor: Color.fromARGB(255, 46, 41, 145),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ئەژمار'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'ماڵەوە',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'پڕۆدەکت'),
          ],
          onTap: (int i) {
            setState(() {
              s = i;
            });
          },
        ),
      ),
    );
  }
}
