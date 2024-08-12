import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twezhinawa/control/constractor.dart';
import 'package:twezhinawa/view/multiSelect.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import '../model/user_model.dart';
import 'Logged_in_widget.dart';


class Add extends StatefulWidget {
  final CardName cardname;
  const Add({
    super.key,
    required this.cardname,
  });

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {

    
  File? _image;
 
  final picker = ImagePicker();
  


Future getImage(ImageSource source, {int? maxHeight, int? maxWidth, int? imageQuality}) async {
    final pickedFile = await picker.getImage(
      source: source,
      maxHeight: MediaQuery.of(context).size.height/8,
      maxWidth: MediaQuery.of(context).size.width/8,
      imageQuality: imageQuality,
    );

    if (mounted)setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('هیج وێنەیەکت دەست نیشان نەکردووە');
      }
    });
  }


  
 static List<String> gender = <String>['نێر', 'مێ'];
  String chooseGender = gender[0];

  static List<String> national = <String>[
    'کورد',
    'عەرەب',
    'تورک',
    'فارس',
    'بیانی'
  ];
  String chooseNational = national[0];
  //

  List<String> _selectedItems = [];

  void _showMultiSelect() async {
     List<String> items = [
      'کوردی',
      'عەرەبی',
      'فارسی',
      'تورکی',
      'English',
      'بیانی',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        
       _selectedItems=controllerLanguage.text.split(',');
       _selectedItems = results;
      });
    }
  }

  List<String> _selectedItems2 = [];
  void _showMultiSelect2() async {
     List<String> items2 = [
      'شەممە',
      'یەکشەممە',
      'دووشەممە',
      'سێ شەممە',
      'چوار شەممە',
      'پێنج شەممە',
      'هەینی'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items2);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
      _selectedItems2=controllerWeekDay.text.split(',');
      _selectedItems2 = results;
      });
    }
  }

  static List<String> city = <String>[
    'سلێمانی',
    'هەولێر',
    'کەرکوک',
    'دهۆک',
    'هەڵەبجە'
  ];
  String chooseCity = city[0];

  static List<String> works = <String>[
    'وەستاکان',
    'بەرگدوور',
    'چاکردنەوە',
    'ئاو و ئاوەڕۆ',
    'چاکەرەوەی ئۆتۆمبێل',
    'کارەبا',
    'ستافەکان',
    'کارگەکان'
  ];
  String chooseWorks = works[0];

  static List<String> grnty = <String>['بەڵێ', 'نەخێر'];
  String chooseGrnty = grnty[0];

  static List<String> typeWork = <String>['تاکە کەسی', 'گروپی'];
  String chooseType = typeWork[0];

  static List<String> money = <String>['دینار', 'دۆلار'];
  String chooseMoney = money[0];


 

  
 






  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerPhone2 = TextEditingController();
  final controllerViber = TextEditingController();
  final controllerWattsapp = TextEditingController();
  final controllerMail = TextEditingController();
  TextEditingController controllerGender = TextEditingController();
  TextEditingController controllerNation = TextEditingController();
  TextEditingController controllerLanguage = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  final controllerplace = TextEditingController();
  TextEditingController controllerService = TextEditingController();
  final controllerWork = TextEditingController();
  TextEditingController controllerGrnty = TextEditingController();
  TextEditingController controllerGroup = TextEditingController();
  final controllerExp = TextEditingController();
  final controllerPriceHour = TextEditingController();
  final controllerPriceMeter = TextEditingController();
  TextEditingController controllerCurrency = TextEditingController();
  final controllerInfo = TextEditingController();
  TextEditingController controllerWeekDay = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();








@override
void dispose (){
  controllerName.dispose();
  controllerCity.dispose();
  controllerCurrency.dispose();
  controllerExp.dispose();
  controllerGender.dispose();
  controllerGrnty.dispose();
  controllerGroup.dispose();
  controllerInfo.dispose();
  controllerLanguage.dispose();
  controllerMail.dispose();
  controllerNation.dispose();
  controllerPhone.dispose();
  controllerPhone2.dispose();
  controllerPriceHour.dispose();
  controllerPriceMeter.dispose();
  controllerService.dispose();
  controllerViber.dispose();
  controllerWattsapp.dispose();
  controllerWeekDay.dispose();
  controllerWork.dispose();
  controllerplace.dispose();
  
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection('product');
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
          body: 
           ListView(
              children:[ Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Center(
                  child: Text(
                    'خانەی زانیارییەکان بە دروستی پڕ بکەرەوە',
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 1, 53),
                        fontFamily: 'kurdish',
                        fontSize: 25),
                  ),
                ),
              ),
      
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 70),
              child: Container(
                color: Colors.black,
                height: 1,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 9,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                    child: FaIcon(
                      FontAwesomeIcons.one,
                      size: 20,
                      color: Color.fromARGB(255, 4, 1, 53),
                    ),
                  ),
                  Text('زانیاری کەسی',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 1, 53),
                          fontSize: 22,
                          fontFamily: 'kurdish'))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerName,
                cursorWidth: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'ناوی سیانی',
                    labelText: 'ناوی سیانی',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Icon(
                      Icons.create,
                      size: 30,
                      color: Colors.black54,
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerPhone,
                cursorWidth: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'ژمارەی تەلەفۆن',
                    labelText: 'ژمارەی تەلەفۆن',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Icon(
                      Icons.call,
                      size: 30,
                      color: Colors.black54,
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerPhone2,
                cursorWidth: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'ژمارەی تەلەفۆن ٢',
                    labelText: 'ژمارەی تەلەفۆن ٢',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Icon(
                      Icons.call,
                      size: 30,
                      color: Colors.black54,
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerViber,
                cursorWidth: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'ژمارەی ڤایبەر',
                    labelText: 'ژمارەی ڤایبەر',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FaIcon(
                        FontAwesomeIcons.viber,
                        color: Colors.black54,
                        size: 31,
                      ),
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerWattsapp,
                cursorWidth: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'ژمارەی وەتس ئەپ',
                    labelText: 'ژمارەی وەتس ئەپ',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.black54,
                        size: 33,
                      ),
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerMail,
                cursorWidth: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'نامەبەری ئەلکترۆنی',
                    labelText: 'نامەبەری ئەلکترۆنی',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Icon(
                      Icons.mail,
                      color: Colors.black54,
                      size: 30,
                    )),
              ),
            ),
            
              
            // zanyary wrdtr
            Container(
              height: MediaQuery.of(context).size.height / 9,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                    child: FaIcon(
                      FontAwesomeIcons.two,
                      size: 20,
                      color: Color.fromARGB(255, 4, 1, 53),
                    ),
                  ),
                  Text('زانیاری وردتر',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 1, 53),
                          fontSize: 22,
                          fontFamily: 'kurdish'))
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: DropdownButtonFormField(
                icon: FaIcon(
                  FontAwesomeIcons.transgender,
                  size: 30,
                ),
                decoration: InputDecoration(
                  labelText: 'ڕەگەز',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontFamily: 'kurdish'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                ),
                value: chooseGender,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'kurdish', fontSize: 16),
                items: gender.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: ( value) {
                  setState(() {
                    chooseGender = value!;
                    controllerGender.text = chooseGender ;
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: DropdownButtonFormField(
                icon: FaIcon(
                  FontAwesomeIcons.earth,
                  size: 30,
                ),
                decoration: InputDecoration(
                  labelText: 'نەتەوە',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontFamily: 'kurdish'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                ),
                value: chooseNational,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'kurdish', fontSize: 16),
                items: national.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    chooseNational = value!;
                    controllerNation.text = chooseNational;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // use this button to open the multi-select dialog
                  ElevatedButton.icon(
                    onPressed: _showMultiSelect,
                    label: Text(
                      "زمانەکان",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          fontFamily: 'kurdish',
                          fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(
                      Icons.translate,
                      size: 30,
                      color: Colors.black87,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shadowColor: Color.fromARGB(255, 29, 122, 199),
                      elevation: 10,
                      fixedSize: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height / 12.5),
                      side: BorderSide(color: Colors.black87, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                  const Divider(
                    height: 30,
                  ),
                  // display selected items
                  Wrap(
                    children: _selectedItems
                        .map((e) => Chip(
                              label: Text(e),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height / 9,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                    child: FaIcon(
                      FontAwesomeIcons.three,
                      size: 20,
                      color: Color.fromARGB(255, 4, 1, 53),
                    ),
                  ),
                  Text('ناونیشان',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 1, 53),
                          fontSize: 22,
                          fontFamily: 'kurdish'))
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: DropdownButtonFormField(
                icon: FaIcon(
                  FontAwesomeIcons.city,
                  size: 30,
                ),
                decoration: InputDecoration(
                  labelText: 'پارێزگا',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontFamily: 'kurdish'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                ),
                value: chooseCity,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'kurdish', fontSize: 16),
                items: city.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    chooseCity = value!;
                    controllerCity.text=chooseCity;
                  });
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerplace,
                  cursorWidth: 2,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'ناوچە',
                    labelText: 'ناوچە',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.building,
                        size: 30,
                        color: Colors.black54,
                      ),
                    ),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon:
                    FaIcon(FontAwesomeIcons.locationDot, color: Colors.black87),
                label: Text(
                  "دیاریکردنی شوێن لەسەر نەخشە",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'kurdish',
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shadowColor: Color.fromARGB(255, 29, 122, 199),
                    elevation: 10,
                    fixedSize: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height / 12.5),
                    side: BorderSide(color: Colors.black87, width: 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 9,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                    child: FaIcon(
                      FontAwesomeIcons.four,
                      size: 20,
                      color: Color.fromARGB(255, 4, 1, 53),
                    ),
                  ),
                  Text('زانیاری کار و پیشە ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 1, 53),
                          fontSize: 22,
                          fontFamily: 'kurdish'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: DropdownButtonFormField(
                icon: Icon(
                  Icons.work,
                  size: 30,
                ),
                decoration: InputDecoration(
                  labelText: 'جۆری خزمەتگوزاری',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontFamily: 'kurdish'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                ),
                value: chooseWorks,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'kurdish', fontSize: 16),
                items: works.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: ( value) {
                  setState(() {
                    chooseWorks = value!;
                    controllerService.text=chooseWorks;
                  });
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerWork,
                  cursorWidth: 2,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'پیشە',
                    labelText: 'پیشە',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.work_outline,
                        size: 30,
                        color: Colors.black54,
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: DropdownButtonFormField(
                icon: FaIcon(
                  FontAwesomeIcons.percent,
                  size: 30,
                ),
                decoration: InputDecoration(
                  labelText: 'گرنتی کار',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontFamily: 'kurdish'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                ),
                value: chooseGrnty,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'kurdish', fontSize: 16),
                items: grnty.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    chooseGrnty = value!;
                    controllerGrnty.text=chooseGrnty;
                  });
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: DropdownButtonFormField(
                icon: Icon(
                  Icons.group,
                  size: 30,
                ),
                decoration: InputDecoration(
                  labelText: 'شێوازی کارکردن',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontFamily: 'kurdish'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                ),
                value: chooseType,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'kurdish', fontSize: 16),
                items: typeWork.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    chooseType = value!;
                    controllerGroup.text=chooseType;
                  });
                },
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerExp,
                cursorWidth: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'ساڵانی کارکردن',
                    labelText: 'ساڵانی کارکردن',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Icon(
                      Icons.history,
                      size: 30,
                      color: Colors.black54,
                    )),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerPriceHour,
                cursorWidth: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'نرخ بۆ کاتژمێرێک',
                    labelText: 'نرخ بۆ کاتژمێرێک',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Icon(
                      Icons.lock_clock,
                      size: 30,
                      color: Colors.black54,
                    )),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller:controllerPriceMeter,
                cursorWidth: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'نرخ بۆ مەترێک',
                    labelText: 'نرخ بۆ مەترێک',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Icon(
                      Icons.gesture,
                      size: 30,
                      color: Colors.black54,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: DropdownButtonFormField(
                icon: Icon(
                  Icons.attach_money_outlined,
                  size: 30,
                ),
                decoration: InputDecoration(
                  labelText: 'جۆری دراوی وەرگرتن',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontFamily: 'kurdish'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                  ),
                ),
                value: chooseMoney,
                style: TextStyle(
                    color: Colors.black, fontFamily: 'kurdish', fontSize: 16),
                items: money.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    chooseMoney = value!;
                    controllerCurrency.text = chooseMoney;
                  });
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                controller: controllerInfo,
                cursorWidth: 7,
                style: TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 4, 1, 53)),
                    ),
                    filled: false,
                    fillColor: Colors.black26,
                    hintText: 'زانیاری زیاتر',
                    labelText: 'زانیاری زیاتر',
                    hintStyle: TextStyle(color: Colors.black87),
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontFamily: 'kurdish'),
                    suffixIcon: Icon(
                      Icons.info_rounded,
                      size: 30,
                      color: Colors.black54,
                    )),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 12
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // use this button to open the multi-select dialog
                  ElevatedButton.icon(
                    onPressed: _showMultiSelect2,
                    label: Text(
                      "ڕۆژەکانی کارکردن",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          fontFamily: 'kurdish',
                          fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(
                      Icons.calendar_month,
                      size: 30,
                      color: Colors.black87,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shadowColor: Color.fromARGB(255, 29, 122, 199),
                      elevation: 10,
                      fixedSize: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height / 12.5),
                      side: BorderSide(color: Colors.black87, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                  const Divider(
                    height: 30,
                  ),
                  // display selected items
                  Wrap(
                    children: _selectedItems2
                        .map((e) => Chip(
                              label: Text(e),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
            



Container(
              height: MediaQuery.of(context).size.height / 9,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                    child: FaIcon(
                      FontAwesomeIcons.five,
                      size: 16,
                      color: Color.fromARGB(255, 4, 1, 53),
                    ),
                  ),
                  Text('یەکێک لەم بەتنانی خوارەوە دابگرە بۆ دانانی وێنە ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 1, 53),
                          fontSize: 19,
                          fontFamily: 'kurdish'))
                ],
              )
            ),


    Padding(
      padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 30),
      child: ElevatedButton(
         style: ElevatedButton.styleFrom(
                      
                      primary: Colors.white,
                      shadowColor: Color.fromARGB(255, 29, 122, 199),
                      elevation: 10,
                      fixedSize: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height / 12.5),
                      side: BorderSide(color: Colors.black87, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
            onPressed: () => getImage(ImageSource.gallery),
            child: Text('وێنەیەک لە گەلەری هەڵبژێرە ',style: TextStyle(color: Colors.black87, fontSize: 22,fontFamily: 'kurdish'),),
          ),
    ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 30),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
  
                      primary: Colors.white,
                      shadowColor: Color.fromARGB(255, 29, 122, 199),
                      elevation: 10,
                      fixedSize: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height / 12.5),
                      side: BorderSide(color: Colors.black87, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
    
  
            onPressed: () => getImage(ImageSource.camera, maxHeight: 480, maxWidth: 640, imageQuality: 80),
            child: Text('ڕاستەوخۆ وێنەیەک بە کامەرا بگرە',style: TextStyle(color: Colors.black87, fontSize: 22,fontFamily: 'kurdish')),
          ),
        ),
        if (_image != null)
          Image.file(
            _image!,
            height: 200,
            width: 200,
          ),






            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: ()  {
                      final user = User(
                        name: controllerName.text,
                        phone: int.parse(controllerPhone.text),
                        phone2: int.parse(controllerPhone2.text),
                        viber: int.parse(controllerViber.text),
                        whatsapp: int.parse(controllerWattsapp.text),
                        mail: controllerMail.text,
                        gender: controllerGender.text,
                        nation: controllerNation.text,
                        language: _selectedItems,
                        city: controllerCity.text,
                        place: controllerplace.text,
                        service: controllerService.text,
                        work: controllerWork.text,
                        grnty: controllerGrnty.text,
                        group:controllerGroup.text,
                        exp:controllerExp.text,
                        priceHour: controllerPriceHour.text,
                        priceMeter: controllerPriceMeter.text,
                        currence: controllerCurrency.text,
                        moreInfo: controllerInfo.text,
                        weekDay: _selectedItems2,
                      );
                      createUser(user);
                      
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'پەسەندکردن',
                      style: TextStyle(fontFamily: 'kurdish', fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 1, 53),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => LogInWidget()));
                    },
                    child: const Text(
                      'پاشگەزبوونەوە',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 1, 15),
                          fontFamily: 'kurdish',
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            )
          ])),
    );
  }
  
Future createUser(User user) async {

   if (_image == null) return;
var uuid = Uuid();
final String ImageName1 = uuid.v1() + '.jpg';
 
    // Upload image to Firebase Storage
    Reference storageRef = firebase_storage.FirebaseStorage.instance.ref().child('images/$ImageName1 ');
    final uploadTask = storageRef.putFile(_image!);
    await uploadTask.whenComplete(() => print('وێنەکەت بە سەرکەوتووی نێردرا'));
  String imageUrl = await storageRef.getDownloadURL();
  imageUrlController.text=imageUrl ;
  final docUser = FirebaseFirestore.instance.collection('product').doc();
  user.id = docUser.id;

  user.images = imageUrl;
  final json = user.toJson();
  await docUser.set(json);
}
}




