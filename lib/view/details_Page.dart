import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../control/constractor.dart';

class Details extends StatefulWidget {
  final Item items;
  final detailCon contact;
  final detailString information;
  const Details({super.key,
   required this.items,
   required this.contact,
   required this.information
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {


  @override
  Widget build(BuildContext context) {
      
 final List<String> crousalList = [
  widget.items.imageUrl
  ];

    final List<Widget> imageSliders = crousalList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
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
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 4, 1, 53),
              title: Center(
                child: Text(
                  widget.items.name,
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
            body: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/4,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                ),
                items: imageSliders,
              ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/13,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(255, 53, 71, 80),
                    child: 
               TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 3.5,
                tabs: [
                Tab(child: Text('پەیوەندی',style: TextStyle(color:Colors.white,fontSize: 19,fontFamily: 'kurdish' )),),
                Tab(child: Text('زانیارریەکان',style: TextStyle(color:Colors.white,fontSize: 19,fontFamily: 'kurdish' )),),
                Tab(child: Text('هەڵسەنگاندن',style: TextStyle(color:Colors.white,fontSize: 19,fontFamily: 'kurdish' )),)
              ]),
                    
                  ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height/1.6,
                  width: double.infinity,
                  child:TabBarView(children: [



                     Column(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 14),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.phone, color: Colors.blue, size: 32,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Text('ژمارەی تەلەفۆن',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.contact.phone.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                            ],
                          ),
                        ),
                        Icon(Icons.copy)
                        ],),
                      )
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 3),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.phone, color: Colors.blue, size: 32,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Text('ژمارەی تەلەفۆن ٢',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.contact.phone2.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                            ],
                          ),
                        ),
                        Icon(Icons.copy)
                        ],),
                      )
                      
                    ),Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [FaIcon(FontAwesomeIcons.viber, color: Colors.purple, size: 32,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Text('ژمارەی ڤایبەر',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.contact.viber.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap:() {
                            
                          },
                          child: Icon(Icons.copy))
                        ],),
                      )
                      
                    ),Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green, size: 32,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: [
                              Text('ژمارەی واتسئەپ',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.contact.whatsapp.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                            ],
                          ),
                        ),
                        Icon(Icons.copy)
                        ],),
                      )
                      
                    )

                  ],),











                  ListView(children :[
      
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.person, color: Colors.black54, size: 32,),
                              Text('ناو',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.items.name,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                        ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [FaIcon(FontAwesomeIcons.productHunt, color: Colors.black54, size: 32,),
                              Text('پیشە',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.items.work,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                        ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [FaIcon(FontAwesomeIcons.city, color: Colors.black54, size: 32,),
                              Text('ناونیشان',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.items.city,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                        ],),
                      ),
                    ),
              
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [FaIcon(FontAwesomeIcons.calendar, color: Colors.black54, size: 32,),
                              Text('ناوچە',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.information.place,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                        ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [FaIcon(FontAwesomeIcons.language, color: Colors.black54, size: 32,),
                              Text('زمانەکان',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text('کوردی , عەرەبی',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                        ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [FaIcon(FontAwesomeIcons.flag, color: Colors.black54, size: 32,),
                              Text('نەتەوە',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.information.nation,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                        ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Icon(Icons.transgender, color: Colors.black54, size: 32,),
                              Text('ڕەگەز',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.information.gender,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                        ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [FaIcon(FontAwesomeIcons.triangleExclamation, color: Colors.black54, size: 32,),
                              Text('گەرەنتی کار',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.information.grnty,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                        ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
                      child:
                       Container(
                        
                        height: MediaQuery.of(context).size.height/8,
                        width: double.infinity,
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
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [FaIcon(FontAwesomeIcons.userGroup, color: Colors.black54, size: 32,),
                              Text('جۆری کارکردن',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                              Text(widget.information.group,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'kurdish'),),
                        ],),
                      ),
                    ),
    ]),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height/4,
          width: double.infinity,
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
            child: Column(
            
              children:[
              Padding(
                padding: const EdgeInsets.symmetric(vertical:20.0),
                child: Text('زانیاری زیاتر', style:TextStyle(color:Colors.black,
                fontSize: 21,fontFamily: 'Kurdish')),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
                child: Container(height: 1,width:double.infinity, color:Colors.black),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.information.moreInfo,style: TextStyle(fontSize: 19,fontFamily: 'kurdish',color:Colors.black),),
              )
            ]),
        ),
      )

                    
                  ],)
                )

                ],
            ),
          ),
      ),
    );
  }
}