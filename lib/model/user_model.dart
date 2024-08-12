
class User {
  String id;
  final String name;
  final int phone;
  final int phone2;
  final int viber;
  final int whatsapp;
  final String mail;
  final String gender;
  final String nation;
  final  language;
  final String city;
  final String place;
  final String service;
  final String work;
  final String grnty;
  final String group;
  final String exp;
  final String priceHour;
  final String priceMeter;
  final String currence;
  final String moreInfo;
  final  weekDay;
  String images ;

  User({
    this.id = '',
    required this.name,
    required this.phone,
    required this.phone2,
    required this.viber,
    required this.whatsapp,
    required this.mail,
    required this.gender,
    required this.nation,
    required this.language,
    required this.city,
    required this.place,
    required this.service,
    required this.work,
    required this.grnty,
    required this.group,
    required this.exp,
    required this.priceHour,
    required this.priceMeter,
    required this.currence,
    required this.moreInfo,
    required this.weekDay,
     this.images='',
  });

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Phone': phone,
        'Phone2': phone2,
        'Viber': viber,
        'Whatsapp': whatsapp,
        'Mail': mail,
        'Gender': gender,
        'Nation': nation,
        'Language': language,
        'City':city,
        'Place':place,
        'Service':service,
        'Work' : work,
        'Grnty kar':grnty,
        'Shewazy karkrdn' : group,
        'Sallany karkrdn' : exp,
        'Price per Hour' : priceHour,
        'Price per Meters' : priceMeter,
        'Type of currency' : currence,
        'More Information' : moreInfo,
        'Week Day' : weekDay,
        'Images' : images      
      };
}