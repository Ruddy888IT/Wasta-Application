import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twezhinawa/control/constractor.dart';
import 'package:twezhinawa/view/details_Page.dart';






// ignore: must_be_immutable
class product_karaba extends StatefulWidget {
   final AppBarName appbarname;
  product_karaba({super.key, required this.works, required this.appbarname});
  String works;

  
  @override
  _product_karabaState createState() => _product_karabaState();
}

class _product_karabaState extends State<product_karaba> {
  final CollectionReference itemsRef =
      FirebaseFirestore.instance.collection('product');
      bool isLoaded=false;

  late List<Item> items;
  late List<String> imageUrls;
  late List<detailCon> contacts;
  late List<detailString> information;
  @override
  void initState() {
    super.initState();
    fetchItems();
      
  }


  Future<void> fetchItems() async {
    
    final List<Item> itemList = (await itemsRef.where('Service', isEqualTo: 'کارەبا').get()).docs
        .map((doc) => Item(name: doc['Name'],
        imageUrl: doc['Images'],
        city: doc['City'],
        work: doc['Work'],
        
        ))
    
        .toList();




        final List<detailCon> con = (await itemsRef.where('Service', isEqualTo: 'کارەبا').get()).docs
        .map((doc) => detailCon(phone: doc['Phone'],
        phone2: doc['Phone2'],
        viber: doc['Viber'],
        whatsapp: doc['Whatsapp'],

        ))
    
        .toList();

        
         final List<detailString> info = (await itemsRef.where('Service', isEqualTo: 'کارەبا').get()).docs
         .map((doc) => detailString(
          nation: doc['Nation'],
         gender: doc['Gender'],
         currence: doc['Type of currency'],
         exp: doc['Sallany karkrdn'],
         grnty: doc['Grnty kar'], 
         group: doc['Shewazy karkrdn'], 
         
         place: doc['Place'], 
         moreInfo: doc['More Information'],







         ))
    
         .toList();

  
    setState(() {
      items = itemList;
      
     
      isLoaded=true;


      contacts=con;
      information=info;
    });
  }






  

  @override
  Widget build(BuildContext context) {
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBar(
            backgroundColor: Color.fromARGB(255, 4, 1, 53),
            title: Center(
              child: Text(
                widget.appbarname.works,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'kurdish', fontSize: 18),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  tooltip: 'ڵیستی دڵخوازەکان')
            ],
          ),
        body:isLoaded? Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: ( context,  index) {
             final item = items[index];
                return Padding(
                  padding:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(items: items[index],
                            information:information[index],
                             contact: contacts[index],
                              
                                )));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(64, 75, 96, .9),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 42, 49, 54),
                                  blurRadius: 4,
                                  offset: Offset(0, 5))
                            ]),
                        child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading:  Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: new BoxDecoration(
                                  border: new Border(
                                      right: new BorderSide(
                                          width: 1.0, color: Colors.white24))),
                              child: Image.network(item.imageUrl,
                                  height: 100, width: 90,
                                  fit: BoxFit.cover,),
                            ),
                  
                            title: Text(item.name
                              ,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Text(item.city,style: TextStyle(color: Colors.white)),
                                Icon(Icons.linear_scale,
                                    color: Colors.yellowAccent),
                                Text(item.work,
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_left,
                                color: Colors.white, size: 30.0))),
                  ),
                );
              },
            ),
          ):Center(child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                            Color.fromARGB(255, 96, 105, 96)),
                      ),),
      ),
    );
  }
}
